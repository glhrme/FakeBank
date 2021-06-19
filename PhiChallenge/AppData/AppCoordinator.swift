//
//  AppCoordinator.swift
//  SomosPhi Challenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    let mainCoordinator = MainCoordinator()
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
