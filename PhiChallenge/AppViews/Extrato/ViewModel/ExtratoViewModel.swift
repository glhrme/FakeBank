//
//  ExtratoViewModel.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

protocol ExtratoViewModelDelegate: AnyObject {
    func goToDetalhes()
}

class ExtratoViewModel {
    weak var delegate: ExtratoViewModelDelegate?
    
    func goToDetalhes() {
        delegate?.goToDetalhes()
    }
    
    func getTransacoes() -> [String] {
        return ["String 1", "String 2"]
    }
}
