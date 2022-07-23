//
//  UserDefaults+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension UserDefaults {
    static let tempJWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJkYWUyOWM5ZDE3M2MxYWFhZTNmY2RlIn0sImlhdCI6MTY1ODUzOTgzNSwiZXhwIjoxNjU5NzQ5NDM1fQ.geaGAz7Uw9Zz3yltF49tvaTxMWhle3gqauJcFDXpkec"
    
    /// UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리합니다.
    enum Keys {
        /// String
        static var PW = "PW"
    }
}
