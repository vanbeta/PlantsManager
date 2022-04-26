//
//  AppCoordinator.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    var model: Users
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        model = Users()
    }
    
    func start() {
        showWelcom()
    }
    
    func showWelcom() {
        let vc = WelcomeViewController.createObject()
        vc.coordinator = self
        vc.viewModel = WelcomViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showLogin() {
        model.logins.append(User(name: "ivan", email: "admin", password: "admin"))

        let vc = LoginViewController.createObject()
        vc.coordinator = self
        let viewModel = LoginViewModel()
        viewModel.setModel(model: model)
        vc.viewModelDelegate = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCreateAccount() {
        let vc = CreateAccountViewController.createObject()
        vc.coordinator = self
        let viewModel = CreateAccountViewModel()
        viewModel.setModel(model: model)
        vc.viewModelDelegate = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
}
