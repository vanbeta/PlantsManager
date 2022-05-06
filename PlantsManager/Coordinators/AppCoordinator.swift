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
    var plants: [Plant]
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        model = Users()
        plants = PlantsDataManager.shared.fetchPlants()
    }
    
    func start() {
        showWelcom()
    }
    
    func showWelcom() {
//        let vc = WelcomeViewController.createObject()
//        let viewModel = WelcomViewModel()
//        viewModel.coordinator = self
//        vc.viewModel = viewModel
//        navigationController.pushViewController(vc, animated: true)
        showMainScreen()
    }
    
    func showLogin() {
        model.logins.append(User(name: "ivan", email: "admin", password: "admin"))

        let vc = LoginViewController.createObject()
        let viewModel = LoginViewModel()
        viewModel.coordinator = self
        viewModel.setModel(model: model)
        vc.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCreateAccount() {
        let vc = CreateAccountViewController.createObject()
        let viewModel = CreateAccountViewModel()
        viewModel.coordinator = self
        viewModel.setModel(model: model)
        vc.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showMainScreen() {
        let vc = MainScreenViewController.createObject()
        let viewModel = MainScreenViewModel()
        viewModel.coordinator = self
        viewModel.setModel(model: plants)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddPlant() {
        let vc = AddPlantViewController.createObject()
        vc.coordinator = self
        let viewModel = AddPlantViewModel()
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
