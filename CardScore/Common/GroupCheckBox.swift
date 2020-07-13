//
//  GroupCheckBox.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class GroupCheckBox: CheckBoxProtocol {
    private var checkBoxes: [CheckBox]!
    var checkedCheckBox: CheckBox?
    
    init(checkBoxes: [CheckBox]) {
        self.checkBoxes = checkBoxes
        self.setDelegate()
    }
    
    public func setDelegate() {
        self.checkBoxes.forEach {
            $0.delegate = self
        }
    }
    
    func onCheck(checkBox: CheckBox) {
        self.checkedCheckBox = checkBox.isChecked ? checkBox : nil
        
        self.checkBoxes.forEach {
            if $0 != checkBox {
                $0.deselect()
            }
        }
    }
    
}
