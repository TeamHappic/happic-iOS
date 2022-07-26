//
//  HaruHappicService.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation
import Alamofire

struct HaruHappicService {
    static let shared = HaruHappicService()
    private let userManager = UserManager.shared

    private init() {}
    
    /// 하루해픽 전체 조회
    func getHaruHappic(year: Int, month: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.haruHappicURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + userManager.getJwtToken]
        let parameters: Parameters = ["year": year, "month": month]
        
        let dataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: [HaruHappicModel].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
