//
//  UIextension.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 20.04.2022.
//

import UIKit

extension UIViewController {
    
    
    func settingsTextField(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray3.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
    }
    
    func createForgotPasswordButton(to textField: UITextField) {
        let forgetPasswordButton = UIButton(type: .system)
        forgetPasswordButton.setTitle("Forgot password?", for: .normal)
        forgetPasswordButton.setTitleColor(.systemBlue, for: .normal)
        forgetPasswordButton.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        textField.rightView = forgetPasswordButton
        textField.rightViewMode = .unlessEditing
    }
}
