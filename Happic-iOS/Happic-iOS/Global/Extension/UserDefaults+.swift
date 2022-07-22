//
//  UserDefaults+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension UserDefaults {
    static let tempJWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJkOTk2Y2Q1N2MzNTQzYjM2N2EwM2E4In0sImlhdCI6MTY1ODQzOTI2MSwiZXhwIjoxNjU5NjQ4ODYxfQ.2SRL-VydGLvfpz5feh-rGC76rPGQpBOOo9apP72IFNo"
    
    /// UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리합니다.
    enum Keys {
        /// String
        static var PW = "PW"
    }
}
