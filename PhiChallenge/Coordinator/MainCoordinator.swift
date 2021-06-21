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
    
    //MARK: - Comprovante Views
    var comprovanteViewController: ComprovanteViewController?
    var comprovanteViewModel: ComprovanteViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getRootViewController())
        self.navigation = navigation
        return navigation
    }

    func getRootViewController() -> ExtratoViewController {
        let extratoViewController = ExtratoViewController()
        let viewModel = ExtratoViewModel()
        viewModel.delegate = self
        extratoViewController.viewModel = viewModel
        self.extratoViewModel = viewModel
        self.extratoViewController = extratoViewController
        return extratoViewController
    }
}

extension MainCoordinator: ExtratoViewModelDelegate {
    func goDetalhes() {
        let comprovanteVC = ComprovanteViewController()
        let viewModel = ComprovanteViewModel()
        viewModel.delegate = self
        comprovanteVC.viewModel = viewModel
        self.comprovanteViewModel = viewModel
        self.comprovanteViewController = comprovanteVC
        self.navigation?.pushViewController(comprovanteVC, animated: true)
    }
}

extension MainCoordinator: ComprovanteViewModelDelegate {
    func goBack() {
        self.navigation?.popViewController(animated: true)
    }
}

