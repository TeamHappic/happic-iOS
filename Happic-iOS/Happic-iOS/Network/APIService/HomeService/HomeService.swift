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
    private let userManager = UserManager.shared

    private init() {}
    
    func homeViewLoad(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.homeURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + userManager.getJwtToken]
        
        let dataRequest = AF.request(url, method: .get, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: HomeModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func getHappicCapsule(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.happicCapsuleURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + userManager.getJwtToken]
        
        let dataRequest = AF.request(url, method: .get, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: HappicCapsuleModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
