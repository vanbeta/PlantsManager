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
    
    weak var coordinator: AppCoordinator?
    var viewModelDelegate: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
        
        createForgotPasswordButton(to: passwordTextField)
        
        bindError()
    }
    
    func bindError() {
        viewModelDelegate?.showError.bind { error  in
            DispatchQueue.main.async {
                self.showAlert(with: "Ошибка", and: error)
            }
        }
    }
    
    @IBAction func createAccountButtonClicked(_ sender: Any) {
        coordinator?.showCreateAccount()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        viewModelDelegate?.checkAccess(email: emailTextField.text!, password: passwordTextField.text!)
    }
}
