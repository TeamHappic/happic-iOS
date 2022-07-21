//
//  HaruHappicTagModel.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation

struct HaruHappicTagModel {
    let id, date, when, place, who, what: String

    enum CodingKeys: String, CodingKey {
        case id, date, when, who, what
        case place = "where"
    }
}
