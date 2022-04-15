//
//  CreateAccountViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class CreateAccountViewController: UIViewController, Storybordable, SettingsTextField {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    weak var coordinator: AppCoordinator?
    var viewModel: CreateAccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTextField(nameTextField)
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        coordinator?.showLogin()
    }
}
