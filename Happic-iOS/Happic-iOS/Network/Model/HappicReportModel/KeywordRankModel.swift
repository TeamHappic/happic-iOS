//
//  KeywordRankModel.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/21.
//

import Foundation

// MARK: - KeywordRankModel
struct KeywordRankModel: Codable {
    let content, category: String
    let count: Int
}