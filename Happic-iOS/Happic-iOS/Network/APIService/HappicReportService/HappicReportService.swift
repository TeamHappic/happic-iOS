//
//  HappicReportService.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/21.
//

import Foundation
import Alamofire

struct HappicReportService {
    static let shared = HappicReportService()
    
    private init() {}
    
    /// 해픽 레포트 조회
    func getHappicReportSummary(year: String, month: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.happicReportSummaryURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + UserDefaults.tempJWT]
        let parameters: Parameters = [
            "year": year,
            "month": month
        ]
        
        let dataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: HappicReportSummaryModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    /// 해픽 레포트 키워드 전체 순위 조회
    func getKeywordRank(year: String, month: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.happicReportKeywordRankURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + UserDefaults.tempJWT]
        let parameters: Parameters = ["year": year, "month": month]
        let dataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: KeywordRankModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    /// 해픽 레포트 카테고리별 순위 조회
    func getCagegoryRank(option: String, year: Int, month: Int,
                         completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.happicReportCategoryRankURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + UserDefaults.tempJWT]
        let parameters: Parameters = ["option": option, "year": year, "month": month]
        
        let dataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: [KeywordModel].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    /// 월별 하루 해픽 조회
    func getMonthlyCount(year: Int, month: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.happicReportMonthlyURL
        let header: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer " + UserDefaults.tempJWT]
        let parameters: Parameters = ["year": year, "month": month]
        
        let dataRequest = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: MonthlyCountModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
