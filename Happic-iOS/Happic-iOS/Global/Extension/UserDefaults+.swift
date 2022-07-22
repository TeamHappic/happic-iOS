//
//  UserDefaults+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension UserDefaults {
    static let tempJWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJkYTk0ZGI1ZWUzNzNhZDgwOGNlOWYyIn0sImlhdCI6MTY1ODQ5OTM4OCwiZXhwIjoxNjU5NzA4OTg4fQ.g_Xuoe92gQZ33G01ntA6-sEf9X6LWw-E5QheA0R2p_Y"
    
    /// UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리합니다.
    enum Keys {
        /// String
        static var PW = "PW"
    }
}
