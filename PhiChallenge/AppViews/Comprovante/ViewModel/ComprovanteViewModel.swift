//
//  ComprovanteViewModel.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

protocol ComprovanteViewModelDelegate: AnyObject {
    func goBack()
}

import Foundation

class ComprovanteViewModel {
    weak var delegate: ComprovanteViewModelDelegate?
    
    func goBack() {
        delegate?.goBack()
    }
}
