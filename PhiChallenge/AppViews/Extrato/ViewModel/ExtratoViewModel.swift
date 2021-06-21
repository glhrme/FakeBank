//
//  ExtratoViewModel.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

protocol ExtratoViewModelDelegate: AnyObject {
    func goDetalhes(_ id: String)
}

protocol ExtratoDataSource: AnyObject {
    func updateSaldo(saldo: Saldo)
    func updateTransacoes(transacoes: [Transacao])
}

class ExtratoViewModel {
    weak var delegate: ExtratoViewModelDelegate?
    weak var dataSource: ExtratoDataSource?
    
    
    func goToDetalhes(_ id: String) {
        delegate?.goDetalhes(id)
    }
    
    func getTransacoes() {
        ExtratoService().fetchTransacoes { (result) in
            switch result {
            case .success(let transacoes):
                self.dataSource?.updateTransacoes(transacoes: transacoes)
            case .failure(let error):
                print(error)
            }
        }
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
