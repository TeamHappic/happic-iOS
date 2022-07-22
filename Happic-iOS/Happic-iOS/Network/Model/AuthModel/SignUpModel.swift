//
//  SignUpModel.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/23.
//

import Foundation


// MARK: - HomeModel
struct SignUpModel: Codable {
    let characterId : Int
    let social, characterName, accessToken : String
    let isPosted : Bool
    

}
