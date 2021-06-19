//
//  ExtratoViewController.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class ExtratoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
