//
//  HaruHappicModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/23.
//

import Foundation

// MARK: - HaruHappicModel
struct HaruHappicModel: Codable {
    let id, photo, thumbnail, place, who, what, dayOfWeek: String
    let day, when: Int

    enum CodingKeys: String, CodingKey {
        case id, day, photo, thumbnail, when, who, what, dayOfWeek
        case place = "where"
    }
}
