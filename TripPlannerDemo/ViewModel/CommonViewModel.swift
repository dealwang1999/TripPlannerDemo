//
//  TripViewModel.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/3/6.
//

import Alamofire
import Combine
import Foundation

final class CommonViewModel: ObservableObject {
    @Published var data: CommonModel.Welcome? = nil
    @Published var isSucces = false

    init() {
        print("aaaaaaaa")
        frtch()
    }

    func frtch() {
        APIClient.request(type: CommonModel.Welcome.self, route: APIRouter.getCommon) { result in
            switch result {
            case .success(let data):
                self.isSucces = true
                self.data = data
            case .failure(let error):
                self.isSucces = false
                print(error)
            }
        }
    }
}
