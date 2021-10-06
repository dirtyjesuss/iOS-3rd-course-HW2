//
//  DateFormatter+Extensions.swift
//  Homework2
//
//  Created by Ruslan Khanov on 05.10.2021.
//

import Foundation

extension DateFormatter {

    static func toSlashFormatted(_ date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: date)
    }

    static func createDate(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"

        return dateFormatter.date(from: string) ?? Date()
    }
}
