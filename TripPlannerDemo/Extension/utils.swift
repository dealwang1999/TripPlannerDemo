//
//  utils.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/2/2.
//

import SwiftUI

func getStatusBarHeigth() -> CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 15.0, *){
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
         statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    else if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}
