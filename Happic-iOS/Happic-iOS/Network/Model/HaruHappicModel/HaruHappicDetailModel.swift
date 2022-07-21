//
//  HaruHappicDetailModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation

struct HaruHappicDetailModel: Codable {
    let id, leftId, rightId: String
    let date: Date
    let photo: String
    let when: Int
    let place, who, what: String

    enum CodingKeys: String, CodingKey {
        case place = "where"
    }
}
