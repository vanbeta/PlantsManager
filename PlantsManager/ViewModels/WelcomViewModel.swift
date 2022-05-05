//
//  WelcomViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation

class WelcomViewModel {
    
    
    var coordinator: AppCoordinator?
}

extension WelcomViewModel: WelcomViewModelDelegate {
    
    
    func btnLoginWasPressed() {
        coordinator?.showLogin()
    }
    
    func btnCreateAccountWasPressed() {
        coordinator?.showCreateAccount()
    }
}
