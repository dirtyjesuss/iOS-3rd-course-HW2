//
//  Message.swift
//  Homework2
//
//  Created by Ruslan Khanov on 05.10.2021.
//

import Foundation

struct Message {
    let text: String
    let date: Date
    let isMine: Bool

    var dateFormatted: String {
        if Calendar.current.isDateInCurrent24Hours(date) {
            return Calendar.current.hoursPassedSinceNowFormatted(from: date)
        } else {
            return DateFormatter.toSlashFormatted(date) ?? ""
        }
    }
}
