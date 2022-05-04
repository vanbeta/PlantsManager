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
//        vc.coordinator = self
//        vc.viewModel = WelcomViewModel()
//        navigationController.pushViewController(vc, animated: true)
        showMainScreen()
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
    
    func showMainScreen() {
        let vc = MainScreenViewController.createObject()
        vc.coordinator = self
        let viewModel = MainScreenViewModel()
        viewModel.setModel(model: plants)
        vc.viewModelDelegate = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddPlant() {
        let vc = AddPlantViewController.createObject()
        vc.coordinator = self
        let viewModel = AddPlantViewModel()
        vc.viewModelDelegate = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
