//
//  UIApplication.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/2.
//
import SwiftUI

extension UIApplication {
    static var statusBarHeight: CGFloat {
        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let height = scene.statusBarManager?.statusBarFrame.height
        else {
            return 0
        }
        return height
    }
}
