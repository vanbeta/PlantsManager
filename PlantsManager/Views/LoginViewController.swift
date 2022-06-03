//
//  LoginViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class LoginViewController: UIViewController, Storybordable {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: LoginViewModelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
        
        createForgotPasswordButton(to: passwordTextField)
        
        bindError()
    }
    
    func bindError() {
        viewModel?.getShowError.bind { error  in
            DispatchQueue.main.async {
                self.showAlert(with: "Error", and: error)
            }
        }
    }
    
    @IBAction func createAccountButtonClicked(_ sender: Any) {
        viewModel?.btnCreareAccountWasPressed()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        viewModel?.checkAccess(email: emailTextField.text!, password: passwordTextField.text!)
    }
}
