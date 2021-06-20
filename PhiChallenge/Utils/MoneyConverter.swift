//
//  MoneyConverter.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

class MoneyConverter {
    static func toMoney(value: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        guard let formattedValue = formatter.string(from: NSNumber(value: value)) else { return nil }
        return formattedValue
    }
}
