//
//  HappicReportSummaryModel.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/21.
//

import Foundation

// MARK: - HappicReportSummaryModel
struct HappicReportSummaryModel: Codable {
    let rank1S: [Rank1]
    let rank2S: [Rank2]
    let rank3S: Rank3S
    let rank4S: Rank4S

    enum CodingKeys: String, CodingKey {
        case rank1S = "rank1s"
        case rank2S = "rank2s"
        case rank3S = "rank3s"
        case rank4S = "rank4s"
    }
}

// MARK: - Rank1
struct Rank1: Codable {
    let content: String
}

// MARK: - Rank2
struct Rank2: Codable {
    let content, category: String
    let count: Int
}

// MARK: - Rank3S
struct Rank3S: Codable {
    let when, place, who, what: [KeywordModel]

    enum CodingKeys: String, CodingKey {
        case when
        case place = "where"
        case who, what
    }
}

// MARK: - KeywordModel
struct KeywordModel: Codable {
    let content: String
    let images: [String]
    let count: Int
}

// MARK: - Rank4S
struct Rank4S: Codable {
    let month, count: Int
}
