//
//  RestAPIClient.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/3/6.
//

import Alamofire
import Foundation

enum NetworkError: Error {
    case NoData, DecodingError, APIError(String)
}

enum APIClient {
    static func request<T: Codable>(type: T.Type, route: APIRouter, completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(route).response { response in
            let result = response.result
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.NoData))
                    return
                }
                guard let obj = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(.failure(.DecodingError))
                    return
                }
                completion(.success(obj))
            case .failure(let error):
                completion(.failure(.APIError(error.localizedDescription)))
            }
        }
    }
}
