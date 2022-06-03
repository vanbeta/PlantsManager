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
        self.usersModel = UsersDataManager()
        self.plantsModel = PlantsDataManager(currentUserEmail: usersModel.fetchCurrentUser())
        
        bindCurrentUser()
    }
    
    func bindCurrentUser() {
        usersModel.getCurrentUserEmail.bind { value in
            DispatchQueue.main.async {
                self.plantsModel.setCurrentUserEmail(email: value)
            }
        }
    }
    
    func start() {
        showWelcom()
    }
    
    func showWelcom() {
        if usersModel.fetchCurrentUser().isEmpty {
            let vc = WelcomeViewController.createObject()
            let viewModel = WelcomViewModel()
            viewModel.coordinator = self
            vc.viewModel = viewModel
            navigationController.pushViewController(vc, animated: true)
        } else {
            showMainScreen()
        }
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
        plantsModel.setCurrentUserEmail(email: usersModel.fetchCurrentUser())   // подумать почему не работает bind !!!
        let vc = MainScreenViewController.createObject()
        let viewModel = MainScreenViewModel()
        viewModel.setUsersModel(model: usersModel)
        viewModel.setModel(model: plantsModel)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPagePlant(id: ObjectIdentifier) {
        let vc = PagePlantViewController.createObject()
        let viewModel = PagePlantViewModel(id: id)
        viewModel.coordinator = self
        viewModel.setModel(model: plantsModel)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddPlant(edit: Bool, currentPlant: Plants) {
        let vc = AddPlantViewController.createObject()
        let viewModel = AddPlantViewModel(edit: edit, plant: currentPlant)
        
        viewModel.setModel(model: plantsModel)
        viewModel.setUserModel(model: usersModel)
        viewModel.coordinator = self
        
        vc.viewModel = viewModel
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }

    func showRecommendation(str: String, model: AddRecomendation) {
        let vc = EditRecommendationViewController.createObject()
        vc.inName = str
        let viewModel = EditRecommendationViewModel()
        viewModel.maintModel = model
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
