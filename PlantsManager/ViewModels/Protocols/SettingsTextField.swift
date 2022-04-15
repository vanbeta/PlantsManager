//
//  SettingsTextField.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 15.04.2022.
//

import UIKit

protocol SettingsTextField {
    
    
    func settingsTextField(_ textField: UITextField)
}

extension SettingsTextField {
    
    
    func settingsTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray3.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
}
