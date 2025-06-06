//
//  ProfileService.swift
//  NetworkAPI
//
//  Created by Dmitriy Permyakov on 09.04.2025.
//  Copyright © 2025 https://github.com/mightyK1ngRichard. All rights reserved.
//

import Foundation
import GRPC
import NIO
import SwiftProtobuf

// MARK: - AuthService

public protocol ProfileService: Sendable {
    func getUserInfo() async throws -> ProfileServiceModel.GetUserInfo.Response
    func updateUserAddress(req: ProfileServiceModel.UpdateUser.Request) async throws -> ProfileServiceModel.UpdateUser.Response
    func getUserAddresses() async throws -> [AddressEntity]
    func createAddress(req: ProfileServiceModel.CreateAddress.Request) async throws -> AddressEntity
    func updateUserImage(req: ProfileServiceModel.UpdateUserImage.Request) async throws -> String
    func updateUserData(username: String, userFIO: String?) async throws
    func getUserByID(userID: String) async throws -> ProfileEntity
    func closeConnection()
}

// MARK: - AuthGrpcServiceImpl

public final class ProfileGrpcServiceImpl: ProfileService {
    private let client: Profile_ProfileServiceAsyncClient
    private let channel: GRPCChannel
    private let authService: AuthService
    private let networkService: NetworkService

    public init(
        configuration: GRPCHostPortConfiguration,
        authService: AuthService,
        networkService: NetworkService
    ) {
        do {
            let channel = try ConfigProvider.makeConection(
                host: configuration.hostName,
                port: configuration.port,
                numberOfThreads: 1
            )
            self.client = Profile_ProfileServiceAsyncClient(channel: channel, interceptors: nil)
            self.channel = channel
            self.authService = authService
            self.networkService = networkService
        } catch {
            #if DEBUG
            fatalError("Ошибка подключения к grpc profile серверу профиля: \(error)")
            #else
            Logger.log(kind: .error, "Ошибка подключения к grpc profile серверу профиля: \(error)")
            assertionFailure("Ошибка подключения к grpc profile серверу: \(error)")
            fatalError("Ошибка подключения к grpc серверу профиля: \(error)")
            #endif
        }
    }
}

public extension ProfileGrpcServiceImpl {

    /// - Important: Для админа
    func getUserByID(userID: String) async throws -> ProfileEntity {
        try await networkService.maybeRefreshAccessToken(using: authService)

        let request = Profile_GetUserInfoByIDReq.with {
            $0.userID = userID
        }

        return try await networkService.performAndLog(
            call: client.getUserInfoByID,
            with: request,
            mapping: { ProfileEntity(from: $0.user) }
        )
    }

    func getUserInfo() async throws -> ProfileServiceModel.GetUserInfo.Response {
        try await networkService.maybeRefreshAccessToken(using: authService)

        let request = Google_Protobuf_Empty()

        let res = try await networkService.performAndLog(
            call: client.getUserInfo,
            with: request,
            mapping: {
                ProfileServiceModel.GetUserInfo.Response(userInfo: .init(
                    previewCakes: $0.userInfo.cakes.map(ProfilePreviewCakeEntity.init(from:)),
                    profile: ProfileEntity(from: $0.userInfo.user)
                ))
            }
        )

        return res
    }

    func createAddress(req: ProfileServiceModel.CreateAddress.Request) async throws -> AddressEntity {
        let request = Profile_CreateAddressReq.with {
            $0.latitude = req.latitude
            $0.longitude = req.longitude
            $0.formattedAddress = req.formattedAddress
        }

        return try await networkService.performAndLog(
            call: client.createAddress,
            with: request,
            mapping: { .init(from: $0.address) }
        )
    }

    func updateUserAddress(req: ProfileServiceModel.UpdateUser.Request) async throws -> ProfileServiceModel.UpdateUser.Response {
        let request = Profile_UpdateUserAddressesReq.with {
            $0.addressID = req.addressID
            if let apartment = req.apartment {
                $0.apartment = apartment
            }
            if let floor = req.floor {
                $0.floor = floor
            }
            if let entrance = req.entrance {
                $0.entrance = entrance
            }
            if let comment = req.comment {
                $0.comment = comment
            }
        }

        return try await networkService.performAndLog(
            call: client.updateUserAddresses,
            with: request,
            mapping: { .init(address: AddressEntity(from: $0.address)) }
        )
    }

    func getUserAddresses() async throws -> [AddressEntity] {
        try await networkService.maybeRefreshAccessToken(using: authService)

        let request = Google_Protobuf_Empty()

        return try await networkService.performAndLog(
            call: client.getUserAddresses,
            with: request,
            mapping: { $0.addresses.map(AddressEntity.init(from:)) }
        )
    }

    func updateUserImage(req: ProfileServiceModel.UpdateUserImage.Request) async throws -> String {
        try await networkService.maybeRefreshAccessToken(using: authService)

        let request = Profile_UpdateUserImageReq.with {
            $0.imageData = req.imageData
            $0.imageKind = req.imageKind.toProto
        }

        return try await networkService.performAndLog(
            call: client.updateUserImage,
            with: request,
            mapping: { $0.imageURL }
        )
    }

    func updateUserData(username: String, userFIO: String?) async throws {
        try await networkService.maybeRefreshAccessToken(using: authService)

        let request = Profile_UpdateUserDataReq.with {
            $0.updatedUserName = username
            if let fio = userFIO {
                $0.updatedFio = fio
            }
        }

        return try await networkService.performAndLog(
            call: client.updateUserData,
            with: request,
            mapping: { _ in }
        )
    }

    func closeConnection() {
        do {
            try channel.close().wait()
        } catch {
            Logger.log(kind: .error, error)
        }
    }
}
