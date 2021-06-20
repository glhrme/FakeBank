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
    @IBOutlet weak var saldoTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setup()
        self.fetchSaldo()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupTableView() {
        self.tableView.register(UINib(nibName: "ExtratoTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifierCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setup() {
        self.viewModel?.dataSource = self
    }
    
    func fetchSaldo() {
        self.viewModel?.getSaldo()
    }
}

extension ExtratoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! ExtratoTableViewCell
        return cell
    }
}

extension ExtratoViewController: ExtratoDataSource {
    func updateSaldo(saldo: Saldo) {
        saldoTextLabel.text = MoneyConverter.toMoney(value: saldo.amount) ?? ""
    }
}
