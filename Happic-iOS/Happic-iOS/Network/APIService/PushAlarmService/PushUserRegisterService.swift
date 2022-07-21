//
//  PushUserRegisterService.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/21.
//

import Foundation
import Alamofire

struct PushUserRegisterService {
    static let shared = PushUserRegisterService()
    
    private init() {}
    
    func registerUserWithFcmToken(token: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.pushUserRegisterURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + UserDefaults.tempJWT]
        let body: Parameters = [
            "fcmToken": token
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: BlankData.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
