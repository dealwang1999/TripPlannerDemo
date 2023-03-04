//
//  View+.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/5.
//

import SwiftUI

extension View {
    func setNavigationBarStyle() -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("primary"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }

    func goBackToolBar(_ title: String, action: @escaping () -> Void) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: action) {
                    Image("icBack")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: -20)
                }
            }
            ToolbarItem(placement: .principal) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
        .setNavigationBarStyle()
    }

    func closeToolBar(_ title: String) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                } label: {
                    Image("close_white")
                        .setNavigationIconStyle()
                }
            }
            ToolbarItem(placement: .principal) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
        .setNavigationBarStyle()
    }

    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
