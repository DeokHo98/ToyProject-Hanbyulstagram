//
//  DateExtension.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import Foundation

extension Date {
    func timeAgoSinceDate() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute, .hour, .day], from: self, to: now)

        if let minutes = components.minute, minutes < 1 {
            return "방금 전"
        } else if let minutes = components.minute, minutes == 1 {
            return "1분 전"
        } else if let minutes = components.minute, minutes > 1 {
            return "\(minutes)분 전"
        } else if let hours = components.hour, hours == 1 {
            return "1시간 전"
        } else if let hours = components.hour, hours > 1 {
            return "\(hours)시간 전"
        } else if let days = components.day, days == 1 {
            return "1일 전"
        } else if let days = components.day, days > 1 {
            return "\(days)일 전"
        } else {
            return "오래 전"
        }
    }
}
