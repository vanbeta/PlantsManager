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
    @IBOutlet weak var checkBox: UIButton!
    
    weak var coordinator: AppCoordinator?
    var viewModel: CreateAccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBox.setImage(UIImage(named:"uncheckedCheckbox"), for: .normal)
        checkBox.setImage(UIImage(named:"checkedCheckbox"), for: .selected)
        settingsTextField(nameTextField)
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveLinear, animations: {}) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        coordinator?.showLogin()
    }
}
