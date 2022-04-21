//
//  CreateAccountViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class CreateAccountViewController: UIViewController, Storybordable {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkBox: UIButton!
    
    weak var coordinator: AppCoordinator?
    var viewModelDelegate: CreateAccountDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBox.setImage(UIImage(named:"uncheckedCheckbox"), for: .normal)
        checkBox.setImage(UIImage(named:"checkedCheckbox"), for: .selected)
        
        settingsTextField(nameTextField)
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
        
        createForgotPasswordButton(to: passwordTextField)
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        coordinator?.showLogin()
    }
    
    @IBAction func termsButtonPressed(_ sender: Any) {
        viewModelDelegate?.getTerms(view: self)
    }
    
    @IBAction func conditionsButtonPressed(_ sender: Any) {
        viewModelDelegate?.getConditions(view: self)
    }
}
