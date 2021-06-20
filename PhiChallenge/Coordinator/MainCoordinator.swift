//
//  BeerCoordinator.swift
//  SomosPhi Challenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class MainCoordinator {
    var navigation: UINavigationController?
    
    //MARK: - Extrato Views
    var extratoViewController: ExtratoViewController?
    var extratoViewModel: ExtratoViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getRootViewController())
        return navigation
    }

    func getRootViewController() -> ExtratoViewController {
        let extratoViewController = ExtratoViewController()
        let viewModel = ExtratoViewModel()
        extratoViewController.viewModel = viewModel
        self.extratoViewModel = viewModel
        self.extratoViewController = extratoViewController
        return extratoViewController
    }
}

extension MainCoordinator: ExtratoViewModelDelegate {
    func goToDetalhes() {
        print("TODO GoToDetalhes")
    }
    
    
}

