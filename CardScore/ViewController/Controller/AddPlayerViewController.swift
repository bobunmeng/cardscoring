//
//  AddPersonViewController.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

protocol PlayerDelegate {
    func onAdd(_ player: Player)
    func onUpdate(_ player: Player)
    func onDelete(_ player: Player)
}

class AddPlayerViewController: UIViewController {

    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var player: Player?
    var delegate: PlayerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.player == nil {
            self.removeButton.isHidden = true
            self.updateButton.setTitle("Add", for: .normal)
        }
        self.playerNameTextField.text = self.player?.name ?? ""
        self.amountTextField.text = "\(self.player?.amount ?? 0)"
        self.updateButton.addTarget(self, action: #selector(self.addOrUpdatePlayer), for: .touchUpInside)
        self.removeButton.addTarget(self, action: #selector(self.removePlayer), for: .touchUpInside)
    }
    
    @objc
    private func addOrUpdatePlayer() {
        if !validateInput() {
            Alert.display("Please input all fields.", on: self)
            return
        }
        
        if self.player == nil {
            self.addPlayer()
        } else {
            self.updatePlayer()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func removePlayer() {
        self.delegate?.onDelete(self.player!)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func addPlayer() {
        let amountStr = amountTextField.text ?? ""
        var amount = 0
        if !amountStr.isEmpty {
            amount = Int(amountStr)!
        }
        let player = Player(id: 5, name: playerNameTextField.text ?? "", amount: amount)
        self.delegate?.onAdd(player)
    }
    
    private func updatePlayer() {
        guard var player = self.player else { fatalError() }
        let amount = Int(amountTextField.text ?? "0")!
        player.name = playerNameTextField.text ?? ""
        player.amount = amount
        self.delegate?.onUpdate(player)
    }
    
    private func validateInput() -> Bool {
        if (playerNameTextField.text ?? "").isEmpty {
            return false
        }
        return true
    }
    
}
