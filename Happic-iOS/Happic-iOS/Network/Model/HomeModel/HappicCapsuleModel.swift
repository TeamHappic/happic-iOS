//
//  HappicCapsuleModel.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/23.
//

import Foundation

struct HappicCapsuleModel: Codable {
    let photo, hour, who, what, place: String

    enum CodingKeys: String, CodingKey {
        case photo, hour, who, what
        case place = "where"
    }
}
