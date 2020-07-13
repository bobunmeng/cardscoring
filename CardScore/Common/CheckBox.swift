//
//  CheckBox.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

protocol CheckBoxProtocol {
    func onCheck(checkBox: CheckBox)
}

class CheckBox: UIButton {
    var isChecked: Bool = false

    var delegate: CheckBoxProtocol?
    
    private let checkedImage: UIImage = #imageLiteral(resourceName: "checked-box")
    private let uncheckedImage: UIImage = #imageLiteral(resourceName: "unchecked-box")
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addTarget(self, action: #selector(self.check), for: .touchUpInside)
    }
    
    @objc
    private func check() {
        self.isChecked = !self.isChecked
        let displayedImage = self.isChecked ? self.checkedImage : self.uncheckedImage
        self.setImage(displayedImage, for: .normal)
        self.delegate?.onCheck(checkBox: self)
    }
    
    public func deselect() {
        self.isChecked = false
        self.setImage(self.uncheckedImage, for: .normal)
    }
    
}
