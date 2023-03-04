//
//  ShopCardModel.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/12.
//

struct ShopCardModel: Identifiable {
    var id: String {
        title
    }

    var title: String
    var time: String
    var description: String
    var imageUrl: String
    var isCheck: Bool
    
    static var examples = [
        ShopCardModel(title: "Tea Ware Exhibition", time: "20 mins", description: "Terminal 1, Non-Restricted Area", imageUrl: "step_01", isCheck: true),
        ShopCardModel(title: "More Than Just Food", time: "15 mins", description: "Terminal 1, Non-Restricted Area", imageUrl: "step_02", isCheck: true),
        ShopCardModel(title: "HK Style-Diner Photo", time: "9 mins", description: "Terminal 1, Non-Restricted Area", imageUrl: "step_03", isCheck: true),
        ShopCardModel(title: "King Bakery", time: "10 mins", description: "Terminal 1, Non-Restricted Area", imageUrl: "step_04", isCheck: true)
    ]
}
