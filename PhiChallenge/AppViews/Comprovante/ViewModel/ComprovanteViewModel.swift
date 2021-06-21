//
//  ComprovanteViewModel.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation

protocol ComprovanteViewModelDelegate: AnyObject {
    func goBack()
}

protocol ComprovanteDataSource: AnyObject {
    func setInfos(comprovante: Detalhes)
}

class ComprovanteViewModel {
    weak var delegate: ComprovanteViewModelDelegate?
    weak var dataSource: ComprovanteDataSource?
    
    let id: String
    
    init(_ id: String) {
        self.id = id
    }
    
    func fetchComprovante() {
        ComprovanteService().fetchDetalhes(id: self.id) { (response) in
            switch response {
            case .success(let detalhes):
                self.dataSource?.setInfos(comprovante: detalhes)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func goBack() {
        delegate?.goBack()
    }
}
