//
//  UserManager.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/27.
//

import Foundation

final class UserManager {
    
    // MARK: - Properties
    
    static let shared = UserManager()
    private(set) var currentLoginStatus: Bool?
    
    @UserDefaultWrapper<String>(key: "jwtToken") private(set) var jwtToken
    
    var hasJwtToken: Bool { return self.jwtToken != nil }

    var isLogin: Bool { return self.currentLoginStatus ?? false }
    var getJwtToken: String { return self.jwtToken ?? "" }

    // MARK: - Life Cycles
    
    private init() {}
    
    // MARK: - Fuctions
    
    func setSocialToken(token: String) {
        self.jwtToken = token
    }
    
    func setLoginStatus(isLoginned: Bool) {
        self.currentLoginStatus = isLoginned
    }
}
