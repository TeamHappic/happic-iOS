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
    
    // MARK: - 소셜 로그인
    static let kakaoLoginURL = baseURL + "/user/signin"
    
    // MARK: - 하루 해픽
    static let haruHappicURL = baseURL + "/daily"
    
    // MARK: - 게시글 생성 및 삭제
    static let isPostedURL = baseURL + "/daily/posted"
    static let uploadImageURL = baseURL + "/file/upload"
    static let recommendTagURL = baseURL + "/daily/keyword"
    static let createContentsURL = baseURL + "/daily"
    static let deleteContentsURL = baseURL + "/daily/"
    
    // MARK: - 푸시 유저 등록
    static let pushUserRegisterURL = baseURL + "/user/push"
    
    // MARK: - 해픽 레포트
    static let happicReportSummaryURL = baseURL + "/mypage"
    static let happicReportKeywordRankURL = baseURL + "/mypage/keyword"
    static let happicReportCategoryRankURL = baseURL + "/mypage/category"
    static let happicReportMonthlyURL = baseURL + "/mypage/monthly"
    
    // MARK: - 메인 화면
    static let homeURL = baseURL + "/home"
    static let happicCapsuleURL = baseURL + "/home/capsule"
    
    // MARK: - 회원 가입
    static let signInURL = baseURL + "/user/signin"
    static let signUpURL = baseURL + "/user/signup"
    
    // MARK: - 캐릭터 변경
    static let characterChangeURL = baseURL + "/setting"
}
