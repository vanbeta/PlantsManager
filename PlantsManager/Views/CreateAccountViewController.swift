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
    
    var viewModel: CreateAccountDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBox.setImage(UIImage(named:"uncheckedCheckbox"), for: .normal)
        checkBox.setImage(UIImage(named:"checkedCheckbox"), for: .selected)
        
        settingsTextField(nameTextField)
        settingsTextField(emailTextField)
        settingsTextField(passwordTextField)
        
        createForgotPasswordButton(to: passwordTextField)
        
        bindAlert()
        bindError()
    }
    
    func bindAlert() {
        viewModel?.getShowAlert.bind { (titleText, text)  in
            DispatchQueue.main.async {
                self.showAlert(with: titleText, and: text)
            }
        }
    }
    
    func bindError() {
        viewModel?.getShowError.bind { error  in
            DispatchQueue.main.async {
                self.showAlert(with: "Ошибка", and: error)
            }
        }
    }
    
    @IBAction func checkBoxPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        viewModel?.btnSignInWasPressed()
    }
    
    @IBAction func termsButtonPressed(_ sender: Any) {
        viewModel?.getTerms()
    }
    
    @IBAction func conditionsButtonPressed(_ sender: Any) {
        viewModel?.getConditions()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        viewModel?.createAccount( email:        emailTextField.text!,
                                  name:         nameTextField.text!,
                                  password:     passwordTextField.text!,
                                  checkBoxTerm: checkBox.state)
    }
    
}
