//
//  APIConstants.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/18.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://3.39.169.83:5001"
    
    // MARK: - Auth
    // 예시: static let signURL = baseURL + "/user/sign"
    
    // MARK: - 푸시 유저 등록
    static let pushUserRegisterURL = baseURL + "/user/push"
    
    // MARK: - 해픽 레포트
    static let happicReportSummaryURL = baseURL + "/mypage"
}
