//
//  CreateAccountViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class CreateAccountViewController: UIViewController, Storybordable {
    
    
    weak var coordinator: AppCoordinator?
    var viewModel: CreateAccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        coordinator?.showLogin()
    }
}
