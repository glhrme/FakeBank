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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.circleImageView.layer.cornerRadius = 10
        self.circleImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
