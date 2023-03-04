//
//  NavigationBar.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/2.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        Grid {
            GridRow {
                Image("close_white")
                Text("Trip Planner")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Trip Planner")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width: UIScreen.main.bounds.width / 3, height: 44)
        }
        .background(Color("primary"))
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
