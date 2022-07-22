//
//  SignUpService.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/23.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService()
    
    private init() {}
    
    func signUp(social: String, characterId: Int, characterName: String, accessToken: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.pushUserRegisterURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [
            "social": social,
            "characterId": characterId,
            "characterName": characterName,
            "accesToken": accessToken
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: SignUpModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
