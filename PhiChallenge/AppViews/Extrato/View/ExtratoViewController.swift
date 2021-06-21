//
//  ExtratoViewController.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 19/06/21.
//

import UIKit

class ExtratoViewController: UIViewController {
    
    let identifierCell = "ExtratoTableViewCell"
    var transacoes: [Transacao] = []
    
    var viewModel: ExtratoViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saldoTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setup()
        self.fetch()
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
    
    func fetch() {
        self.viewModel?.getSaldo()
        self.viewModel?.getTransacoes()
    }
}

extension ExtratoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transacoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! ExtratoTableViewCell
        cell.setup(transacao: transacoes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.goToDetalhes()
    }
}

extension ExtratoViewController: ExtratoDataSource {
    func updateTransacoes(transacoes: [Transacao]) {
        for transacao in transacoes {
            self.transacoes.append(transacao)
            self.tableView.reloadData()
        }
        self.tableView.reloadData()
    }
    
    func updateSaldo(saldo: Saldo) {
        saldoTextLabel.text = MoneyConverter.toMoney(value: saldo.amount) ?? ""
    }
}
