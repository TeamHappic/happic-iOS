//
//  temp.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/08.
//

import Foundation
import Alamofire

// Service code 예시

// struct UserService {
//    static let shared = UserService()
//
//    private init() {}
//
//        // 회원가입
//    func signUp(name: String, email: String, password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
//        let url = APIConstants.signURL
//        let header: HTTPHeaders = ["Content-Type" : "application/json"]
//        let body: Parameters = [
//            "name": name,
//            "email": email,
//            "password": password
//        ]
//
//        // Request 생성
//                // get통신에서는 encoding에 URLEncoding.default 사용
//        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
//
//        // Request 시작
//        dataRequest.responseData { response in
//            switch response.result {
//            // 성공 시 상태코드와 데이터(value) 수신
//            case .success:
//                guard let statusCode = response.response?.statusCode else { return }
//                guard let value = response.value else { return }
//
//                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: SignUpData.self)
//                completion(networkResult)
//
//            // 실패 시 networkFail(통신 실패)신호 전달
//            case .failure:
//                completion(.networkFail)
//            }
//        }
//    }
// }
