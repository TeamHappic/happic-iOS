//
//  UserDefaults+.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/09.
//

import Foundation

extension UserDefaults {
    static let tempJWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjJkOTQ5MmJkMTJjNjlhNWNkYzI2MjVhIn0sImlhdCI6MTY1ODQwNzIxMSwiZXhwIjoxNjU5NjE2ODExfQ.EzTF7OtrQCky5dB4wm_3F0dcjXuzawpH_fSbqSw70xY"
    
    /// UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리합니다.
    enum Keys {
        /// String
        static var PW = "PW"
    }
}
