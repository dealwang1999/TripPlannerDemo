//
//  Image+.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/5.
//

import Foundation
import SwiftUI

extension Image {
    func setNavigationIconStyle() -> some View {
        self.resizable()
        .frame(width: 17, height: 17)
    }
}
