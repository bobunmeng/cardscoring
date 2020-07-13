//
//  PlayerTableViewCell.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    static var cellIdentifier: String = "PlayerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.selectionStyle = .none
    }
    
    func configure(player: Player) {
        self.playerLabel.text = player.name
        self.moneyLabel.text = "\(player.amount),00 Kc"
        
        if player.amount >= 0 {
            self.moneyLabel.textColor = .systemBlue
        } else {
            self.moneyLabel.textColor = .systemRed
        }
    }
    
    override func prepareForReuse() {
        self.playerLabel.text = ""
        self.moneyLabel.text = ""
        self.checkBox.isChecked = false
    }
    
}
