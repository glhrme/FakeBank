//
//  ComprovanteViewController.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//
import UIKit

class ComprovanteViewController: UIViewController {
    
    var viewModel: ComprovanteViewModel?

    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var tipoMovimentacaoTextLabel: UILabel!
    @IBOutlet weak var valorTextLabel: UILabel!
    @IBOutlet weak var recebedorTextLabel: UILabel!
    @IBOutlet weak var bancoTextLabel: UILabel!
    @IBOutlet weak var dataHoraTextLabel: UILabel!
    @IBOutlet weak var autenticacaoTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.dataSource = self
        mainStackView.isHidden = false
        loadingActivityIndicator.isHidden = true
        self.fetch()
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        viewModel?.goBack()
    }
    
    
    func fetch() {
        viewModel?.fetchComprovante()
    }

    @IBAction func compartilharPressed(_ sender: UIButton) {
        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, self.view.isOpaque, UIScreen.main.scale)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let sharedItens: [Any] = [image]
        let activityViewController = UIActivityViewController(activityItems: sharedItens , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension ComprovanteViewController: ComprovanteDataSource {
    func setInfos(comprovante: Detalhes) {
        mainStackView.isHidden = false
        loadingActivityIndicator.isHidden = true
        
        self.tipoMovimentacaoTextLabel.text = comprovante.description
        self.valorTextLabel.text = MoneyConverter.toMoney(value: comprovante.amount)
        self.recebedorTextLabel.text = comprovante.to
        self.bancoTextLabel.text = "PagBank"
        self.autenticacaoTextLabel.text = comprovante.authentication
        self.dataHoraTextLabel.text = comprovante.createdAt
    }
}
