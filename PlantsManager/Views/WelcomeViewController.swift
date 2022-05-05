//
//  WelcomeViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController, Storybordable {
    
    
    var viewModel: WelcomViewModelDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel?.btnLoginWasPressed()
    }
    
    @IBAction func createAccountButtonClicced(_ sender: Any) {
        viewModel?.btnCreateAccountWasPressed()
    }
}
