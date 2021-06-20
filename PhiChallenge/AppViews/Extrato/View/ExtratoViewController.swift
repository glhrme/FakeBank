//
//  ExtratoViewController.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class ExtratoViewController: UIViewController {
    
    let identifierCell = "ExtratoTableViewCell"
    var data: [String] = []
    
    var viewModel: ExtratoViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ExtratoTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifierCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.data = viewModel?.getTransacoes() ?? []
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ExtratoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! ExtratoTableViewCell
        return cell
    }
}
