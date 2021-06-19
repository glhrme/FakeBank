//
//  BeerCoordinator.swift
//  SomosPhi Challenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class MainCoordinator {
    var navigation: UINavigationController?
    var extratoViewController: ExtratoViewController?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getRootViewController())
        return navigation
    }

    func getRootViewController() -> ExtratoViewController {
        let extratoViewController = ExtratoViewController()
        self.extratoViewController = extratoViewController
        return extratoViewController
    }
    
}

