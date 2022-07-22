//
//  UserDefaults+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension UserDefaults {
    static let tempJWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJkYWUyNjFhNzU0YzcwYmFiMGY0OTBkIn0sImlhdCI6MTY1ODUxMTk3OSwiZXhwIjoxNjU5NzIxNTc5fQ.87qRi8-V3U-pNuJK5Yuwwqmrg3eITqcaNW8fHDqDEbU"
    
    /// UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리합니다.
    enum Keys {
        /// String
        static var PW = "PW"
    }
}
