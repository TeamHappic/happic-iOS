//
//  KakaoLoginService.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation
import Alamofire

struct KakaoLoginService {
    static let shared = KakaoLoginService()
    
    private init() {}
    
    func loginWithKakao(kakaoToken: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.signInURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "accessToken": kakaoToken
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: KakaoLoginModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
