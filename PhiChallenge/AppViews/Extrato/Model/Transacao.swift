//
//  Transacao.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

struct Transacao: Codable {
    let createdAt: String
    let id: String
    let amount: Double
    let to: String
    let description: String
    let tType: String
    
    func getFormatedDate() -> String {
        if let date = DateConverter.formatDate(toFormat: self.createdAt) {
            let calendar = Calendar.current.dateComponents([.day, .month], from: date)
            guard let day = calendar.day, let month = calendar.month else { return "" }
            return "\(day)/\(String(month))"
        }
        return ""
    }
    
}

struct MyStatement: Codable {
    let items: [Transacao]
}

enum tType: String {
    case saida = "TRANSFEROUT"
    case entrada = "TRANSFERIN"
    case pixEntrada = "PIXCASHIN"
    case pixSaica = "PIXCASHOUT"
    case bankCashIn = "BANKSLIPCASHIN"
    case bankCashOut = "BANKSLIPCASHOUT"
}
