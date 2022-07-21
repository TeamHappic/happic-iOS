//
//  RecommendTagModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation

// MARK: - RecommendTagModel
struct RecommendTagModel: Codable {
    let currentDate: String
    let place, who, what: [String]

    enum CodingKeys: String, CodingKey {
        case currentDate, who, what
        case place = "where"
    }
}
