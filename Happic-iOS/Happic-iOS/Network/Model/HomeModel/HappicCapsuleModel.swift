//
//  HappicCapsuleModel.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/23.
//

import Foundation

// MARK: - HappicCapsuleModel
struct HappicCapsuleModel: Codable {
    let date: String
    let photo: String
    let when: Int
    let place, who, what: String
    
    enum CodingKeys: String, CodingKey {
        case date, photo, when
        case place = "where"
        case who, what
    }
}
