//
//  PreviewCakeEntity.swift
//  NetworkAPI
//
//  Created by Dmitriy Permyakov on 17.03.2025.
//

import Foundation

public struct PreviewCakeEntity: Sendable, Hashable {
    /// ID торта
    public let id: String
    /// Название торта
    public let name: String
    /// URL изображения торта
    public let imageURL: String
    /// Цена за кг
    public let kgPrice: Double
    /// Рейтинг (0-5)
    public let rating: Int
    /// Число отзывов
    public let reviewsCount: Int
    /// Описание торта
    public let description: String
    /// Масса торта (кг)
    public let mass: Double
    /// Статус торта
    public let status: CakeStatusEntity
    /// Информация о владельце
    public let owner: UserEntity
    /// Список начинок
    public let fillings: [FillingEntity]
    /// Список категорий
    public let categories: [CategoryEntity]
    /// Hex цвета торта
    public let colorsHex: [String]
    /// Скидка на цену за кг
    public let discountKgPrice: Double?
    /// Дата окончания скидки
    public let discountEndTime: Date?
    /// Дата создания торта
    public let dateCreation: Date
    /// Ссылка на 3Д модель
    public let model3DURL: String?

    public init(
        id: String,
        name: String,
        imageURL: String,
        kgPrice: Double,
        rating: Int,
        reviewsCount: Int,
        description: String,
        mass: Double,
        status: CakeStatusEntity,
        owner: UserEntity,
        fillings: [FillingEntity],
        categories: [CategoryEntity],
        colorsHex: [String],
        discountKgPrice: Double?,
        discountEndTime: Date?,
        dateCreation: Date,
        model3DURL: String?
    ) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.kgPrice = kgPrice
        self.rating = rating
        self.reviewsCount = reviewsCount
        self.description = description
        self.mass = mass
        self.status = status
        self.owner = owner
        self.fillings = fillings
        self.categories = categories
        self.colorsHex = colorsHex
        self.discountKgPrice = discountKgPrice
        self.discountEndTime = discountEndTime
        self.dateCreation = dateCreation
        self.model3DURL = model3DURL
    }
}

// MARK: - Cake_Cake

extension PreviewCakeEntity {
    @available(*, deprecated, message: "Use init(from:Cake_PreviewCake) instead")
    init(from model: Cake_Cake) {
        self = PreviewCakeEntity(
            id: model.id,
            name: model.name,
            imageURL: model.imageURL,
            kgPrice: model.kgPrice,
            rating: Int(model.rating),
            reviewsCount: Int(model.reviewsCount),
            description: model.description_p,
            mass: model.mass,
            status: CakeStatusEntity(from: model.status),
            owner: UserEntity(from: model.owner),
            fillings: model.fillings.map { FillingEntity(from: $0) },
            categories: model.categories.map { CategoryEntity(from: $0) },
            colorsHex: [],
            discountKgPrice: model.hasDiscountKgPrice ? model.discountKgPrice : nil,
            discountEndTime: model.hasDiscountEndTime ? model.discountEndTime.date : nil,
            dateCreation: model.dateCreation.date,
            model3DURL: model.model3Durl
        )
    }

    init(from model: Cake_PreviewCake) {
        self = PreviewCakeEntity(
            id: model.id,
            name: model.name,
            imageURL: model.previewImageURL,
            kgPrice: model.kgPrice,
            rating: Int(model.rating),
            reviewsCount: Int(model.reviewsCount),
            description: model.description_p.value,
            mass: model.mass,
            status: CakeStatusEntity(from: model.status),
            owner: UserEntity(from: model.owner),
            fillings: [],
            categories: [],
            colorsHex: model.colorsHex,
            discountKgPrice: model.hasDiscountKgPrice ? model.discountKgPrice.value : nil,
            discountEndTime: model.hasDiscountEndTime ? model.discountEndTime.date : nil,
            dateCreation: model.dateCreation.date,
            model3DURL: model.model3Durl
        )
    }
}

public extension PreviewCakeEntity {
    /// Флаг, новый ли торт. Торт считается новым, если разница меньше 8 дн
    var isNew: Bool {
        let componentsDif = Calendar.current.dateComponents(
            [.year, .month, .day],
            from: dateCreation,
            to: Date.now
        )
        guard componentsDif.month == 0 && componentsDif.year == 0 else {
            return false
        }

        // Получаем разницу нынешней даты и даты создания объявления
        guard let difDay = componentsDif.day else {
            return false
        }

        // Если разница меньше 8, объявление считается новым
        return difDay < 8
    }
}
