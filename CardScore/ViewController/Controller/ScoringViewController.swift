//
//  ScoringViewController.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {
    
    @IBOutlet weak var player1CheckBox: CheckBox!
    @IBOutlet weak var player2CheckBox: CheckBox!
    @IBOutlet weak var player3CheckBox: CheckBox!
    
    @IBOutlet weak var place1: CheckBox!
    @IBOutlet weak var place2: CheckBox!
    @IBOutlet weak var place3: CheckBox!
    @IBOutlet weak var place4: CheckBox!
    
    var playerGroupCheckBox: GroupCheckBox!
    var placeGroupCheckBox: GroupCheckBox!
    
    private var viewModel = ScoringViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.playerGroupCheckBox = GroupCheckBox(checkBoxes: [player1CheckBox, player2CheckBox, player3CheckBox])
        self.placeGroupCheckBox = GroupCheckBox(checkBoxes: [place1, place2, place3, place4])
    }
    
    @IBAction func update(_ sender: UIButton) {
        
    }
    
}

class Alert {
    static func display(_ msg: String, on controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
