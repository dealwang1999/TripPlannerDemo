//
//  APIRouter.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/3/6.
//

import Alamofire
import Foundation

public enum APIRouter: URLRequestConvertible {
    case getCommon

    private var urlPath: String {
        switch self {
        case .getCommon:
            return "https://cdn-sit-hkia-tp-web.azureedge.net/data/json/trip.json"
        }
    }

    private var method: HTTPMethod {
        switch self {
        case .getCommon:
            return .get
        }
    }

    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = method.rawValue
        return urlrequest
    }
}
