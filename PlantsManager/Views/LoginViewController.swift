//
//  LoginViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class LoginViewController: UIViewController, Storybordable {
    
    
    weak var coordinator: AppCoordinator?
    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountButtonClicced(_ sender: Any) {
        coordinator?.showCreateAccount()
    }
}
