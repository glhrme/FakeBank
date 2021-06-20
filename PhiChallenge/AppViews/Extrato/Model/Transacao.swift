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
}

struct MyStatement: Codable {
    let items: [Transacao]
}
