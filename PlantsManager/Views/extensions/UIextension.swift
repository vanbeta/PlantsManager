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
        forgetPasswordButton.addTarget(self, action: #selector(showForgotPassword), for: .touchUpInside)
        textField.rightView = forgetPasswordButton
        textField.rightViewMode = .unlessEditing
    }
    
    @objc
    func showForgotPassword() {
        showAlert(with: "ForgotPassword", and: "Sorry we can't do anything)")
    }
    
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showRemoveAlert(with title: String, and message: String,  _ completion: @escaping (Bool) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) { (action: UIAlertAction!) in
            completion(true)
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction!) in
            completion(false)
        })
        self.present(alertController, animated: true, completion: nil)
    }
}
