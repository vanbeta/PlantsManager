//
//  AppCoordinator.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    var model: UsersDataManager
    var plantsModel: PlantsDataManager
    var usersModel: UsersDataManager
        
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.model = UsersDataManager()
        self.plantsModel = PlantsDataManager()
        self.usersModel = UsersDataManager()
    }
    
    func start() {
        showWelcom()
    }
    
    func showWelcom() {
        let vc = WelcomeViewController.createObject()
        let viewModel = WelcomViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showLogin() {
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
        viewModel.setModel(model: plantsModel)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddPlant() {
        let vc = AddPlantViewController.createObject()
        vc.coordinator = self
        let viewModel = AddPlantViewModel()
        viewModel.setModel(model: plantsModel)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPagePlant(id: UUID) {
        let vc = PagePlantViewController.createObject()
        vc.coordinator = self
        let viewModel = PagePlantViewModel(id: id)
        viewModel.setModel(model: plantsModel)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
