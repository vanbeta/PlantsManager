//
//  LoginViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class LoginViewController: UIViewController, Storybordable, SettingsTextField {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    weak var coordinator: AppCoordinator?
    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
    }
    
    @IBAction func createAccountButtonClicced(_ sender: Any) {
        coordinator?.showCreateAccount()
    }
}
