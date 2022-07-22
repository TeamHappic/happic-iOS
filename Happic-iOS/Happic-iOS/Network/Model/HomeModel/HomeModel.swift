//
//  HomeModel.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/22.
//

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let characterId, growthRate, level: Int
    let characterName: String
    let isPosted: Bool
    
    enum CodingKeys: String, CodingKey {
        case characterId, level, characterName, isPosted
        case growthRate = "growth_rate"
    }
}
