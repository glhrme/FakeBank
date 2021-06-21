//
//  ExtratoTableViewCell.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var acaoTextLabel: UILabel!
    @IBOutlet weak var destinoTextLabel: UILabel!
    @IBOutlet weak var valueTextLabel: UILabel!
    @IBOutlet weak var dateTextlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circleImageView.layer.cornerRadius = 10
        self.circleImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(transacao: Transacao) {
        let color = self.getTransactionColor(tipo: transacao.tType)
        self.valueTextLabel.textColor = color
        self.circleImageView.backgroundColor = color
        self.dateTextlabel.text = transacao.getFormatedDate()
        self.acaoTextLabel.text = transacao.description
        self.valueTextLabel.text = MoneyConverter.toMoney(value: transacao.amount)
        self.destinoTextLabel.text = transacao.to ?? "Desconhecido"
    }
    
    func getTransactionColor(tipo: String) -> UIColor {
        guard let tipo = tType(rawValue: tipo) else { return #colorLiteral(red: 0.1674444675, green: 0.1676144898, blue: 0.1726495624, alpha: 1) }
        if (tipo == .entrada || tipo == .pixEntrada || tipo == .bankCashIn) {
            return #colorLiteral(red: 0, green: 0.7922323942, blue: 0.7409712672, alpha: 1)
        } else {
            return #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
    }
    
}
