//
//  CreateAccountViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation
import UIKit

class CreateAccountViewModel {

    
    weak var coordinator: AppCoordinator?
    var model: UsersDataManager?
    var showAlert = Dynamic(("", ""))
    var showError = Dynamic("")

    func setModel(model: UsersDataManager) {
        self.model = model
    }
}

extension CreateAccountViewModel: CreateAccountDelegate {

    
    
    var getShowAlert: Dynamic<(String, String)> { showAlert }
    
    var getShowError: Dynamic<String> { showError }
    
    func btnSignInWasPressed() {
        coordinator?.showLogin()
    }
                    
    func getTerms() {
        getShowAlert.value = ("Terms", "We need your soul!")
    }
    
    func getConditions() {
        getShowAlert.value = ("Conditions", "And all your money!")
    }
    
    func createAccount(email: String, name: String, password: String, checkBoxTerm: UIControl.State) {
        guard checkBoxTerm == .selected else {
            showError.value = "Accept terms and conditions"
            return
        }
        model?.addUser(user: User(email: email, name: name, password: password)) { errorResult in
            switch errorResult {
            case .success:
                coordinator?.showLogin()
            case .failure(let error):
                showError.value = error.localizedDescription
            }
        }
    }
}
