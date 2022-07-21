//
//  CreateContentsModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation

// MARK: - CreateContentsModel
struct CreateContentsModel: Codable {
    let photo: String
    let when, place, who, what: String

    enum CodingKeys: String, CodingKey {
        case photo, when, who, what
        case place = "where"
    }
}

