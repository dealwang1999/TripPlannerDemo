//
//  DataUtil.swift
//  TripPlannerDemo
//
//  Created by dealwang on 2023/3/7.
//

import Foundation

final class DataUtil {
    static func calculateTimeBetweenDates(startDate: Date, endDate: Date) -> String {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.minute, .hour], from: startDate, to: endDate)
            let hour = components.hour ?? 0
            let minute = components.minute ?? 0
            if hour > 0 {
                return "\(hour)小时"
            } else {
                return "\(minute)分钟"
            }
        }
}
