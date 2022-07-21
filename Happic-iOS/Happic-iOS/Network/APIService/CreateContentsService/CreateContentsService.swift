//
//  CreateContentsService.swift
//  Happic-iOS
//
//  Created by devxsby on 2022/07/21.
//

import Foundation
import Alamofire

struct CreateContentsService {
    static let shared = CreateContentsService()
    
    private init() {}
    
    /// 오늘 하루해픽 게시글 작성 여부 조회
    func getPostingStatus(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.isPostedURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "x-auth-token": "jwt token"]
        
        let dataRequest = AF.request(url, method: .get, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: PostingStatusModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    /// 게시글 작성 시 최다 태그 추천
    func getRecommendTag(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.isPostedURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "x-auth-token": "jwt token"]
        
        let dataRequest = AF.request(url, method: .get, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: RecommendTagModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
