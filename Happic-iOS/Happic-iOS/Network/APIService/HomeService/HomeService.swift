//
//  HomeService.swift
//  Happic-iOS
//
//  Created by Zaid Kang on 2022/07/22.
//

import Foundation
import Alamofire

struct HomeService {
    static let shared = HomeService()
    
    private init() {}
    
    func homeViewLoad(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.homeURL
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        let body: Parameters = [:]  //빈배열 표시
        
        let dataRequest = AF.request(url, method: .get, parameters: body, encoding: JSONEncoding.default, headers: header)
        
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

