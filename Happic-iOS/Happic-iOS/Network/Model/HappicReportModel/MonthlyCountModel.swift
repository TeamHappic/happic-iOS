//
//  MonthlyCountModel.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/21.
//

import Foundation

// MARK: - MonthlyCountModel
struct MonthlyCountModel: Codable {
    let month, count: Int
    let dates: [Int]
}
