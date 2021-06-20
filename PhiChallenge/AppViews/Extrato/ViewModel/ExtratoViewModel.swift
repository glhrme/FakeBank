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

protocol ExtratoDataSource: AnyObject {
    func updateSaldo(saldo: Saldo)
}

class ExtratoViewModel {
    weak var delegate: ExtratoViewModelDelegate?
    weak var dataSource: ExtratoDataSource?
    
    func goToDetalhes() {
        delegate?.goToDetalhes()
    }
    
    func getTransacoes() -> [String] {
        return ["String 1", "String 2"]
    }
    
    func getSaldo() {
        ExtratoService().fetchSaldo { (result) in
            switch result {
            case .success(let saldo):
                self.dataSource?.updateSaldo(saldo: saldo)
            case .failure(let error):
                print(error)//Dispatch errors
            }
        }
    }
}
