//
//  WelcomeViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController, Storybordable {
    
    
    var coordinator: AppCoordinator?
    var viewModel: WelcomViewModel? //!!! от дилигата
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        coordinator?.showLogin()
    }
    
    @IBAction func createAccountButtonClicced(_ sender: Any) {
        coordinator?.showCreateAccount()
    }
}
