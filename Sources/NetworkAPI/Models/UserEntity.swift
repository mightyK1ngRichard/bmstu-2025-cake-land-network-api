//
//  UserEntity.swift
//  NetworkAPI
//
//  Created by Dmitriy Permyakov on 17.03.2025.
//

import Foundation

/// Информация о владельце
public struct UserEntity: Sendable, Hashable {
    /// ID пользователя
    public let id: String
    /// Полное имя
    public let fio: String?
    /// Никнейм
    public let nickname: String
    /// Электронная почта
    public let mail: String
    /// Аватар пользователя
    public let imageURL: String?
    /// Шапка профиля
    public let headerImageURL: String?

    public init(
        id: String,
        fio: String?,
        nickname: String,
        mail: String,
        imageURL: String?,
        headerImageURL: String?
    ) {
        self.id = id
        self.fio = fio
        self.nickname = nickname
        self.mail = mail
        self.imageURL = imageURL
        self.headerImageURL = headerImageURL
    }
}

// MARK: - Cake_User

extension UserEntity {
    init(from model: Cake_User) {
        let fio = model.hasFio ? model.fio.value : nil
        self = UserEntity(
            id: model.id,
            fio: fio,
            nickname: model.nickname,
            mail: model.mail,
            imageURL: model.hasImageURL ? model.imageURL.value : nil,
            headerImageURL: model.hasHeaderImageURL ? model.headerImageURL.value : nil
        )
    }

    public init(from model: ProfileEntity) {
        self = UserEntity(
            id: model.id,
            fio: model.fio,
            nickname: model.nickname,
            mail: model.mail,
            imageURL: model.imageURL,
            headerImageURL: model.headerImageURL
        )
    }
}
