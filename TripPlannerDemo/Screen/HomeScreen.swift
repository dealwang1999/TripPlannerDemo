//
//  ContentView.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/5.
//

import Alamofire
import SwiftUI

struct HomeScreen: View {
    @State fileprivate var selctTab = Tab.artCulture

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                TabBar(data: [Tab.artCulture.tabLabel, Tab.shopDine.tabLabel], currentTag: $selctTab)
                TabView(selection: $selctTab) {
                    Tab.shopDine.content
                    Tab.artCulture.content
                }
            }
            .closeToolBar("Trip Planner")
        }
    }
}

private enum Tab: CaseIterable {
    case artCulture, shopDine

    @ViewBuilder
    var content: some View {
        switch self {
        case .artCulture: ArtCultureScreen().tag(self)
        case .shopDine: ShopDineScreen().tag(self)
        }
    }

    var tabLabel: TabBar<Self>.Item {
        switch self {
        case .artCulture:
            return .init(title: "Art & culture", tag: self)
        case .shopDine:
            return .init(title: "Shop & Dine", tag: self)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
