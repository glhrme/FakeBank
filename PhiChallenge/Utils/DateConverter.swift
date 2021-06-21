//
//  DateFormatter.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

class DateConverter {
    static func formatDate(toFormat: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = .withFullDate
        return dateFormatter.date(from: toFormat)
    }
}
