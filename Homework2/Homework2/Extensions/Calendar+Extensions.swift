//
//  Calendar+Extensions.swift
//  Homework2
//
//  Created by Ruslan Khanov on 06.10.2021.
//

import Foundation

extension Calendar {

    func isDateInCurrent24Hours(_ date: Date) -> Bool {
        guard let hoursPassed = dateComponents([.hour], from: date, to: Date()).hour else {
            return false
        }

        return hoursPassed < 24
    }

    func hoursPassedSinceNowFormatted(from date: Date) -> String {
        guard let hoursPassed = dateComponents([.hour], from: date, to: Date()).hour else {
            return ""
        }

        guard hoursPassed > 0 else {
            return "less than an hour ago"
        }
        return "\(hoursPassed)h ago"
    }
}
