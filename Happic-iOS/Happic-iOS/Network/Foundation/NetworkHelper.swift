//
//  NetworkHelper.swift
//  Happic-iOS
//
//  Created by sejin on 2022/07/18.
//

import Foundation

struct NetworkHelper {
    private init() {}
    
    // 상태 코드와 데이터, decoding type을 가지고 통신의 결과를 핸들링하는 함수
    static func parseJSON<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(BaseResponse<T>.self, from: data) else { return .pathErr("pathErr") }
        
        switch statusCode {
        case 200..<300: return .success(decodedData)
        case 400..<500: return .requestErr(decodedData)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
}
