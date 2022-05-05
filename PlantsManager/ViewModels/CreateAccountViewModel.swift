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
    var model: Users?
    var showAlert = Dynamic(("", ""))
    var showError = Dynamic("")

    func setModel(model: Users) {
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
    
    func createAccount(name: String, email: String, password: String, checkBoxTerm: UIControl.State) {
        guard checkBoxTerm == .selected else {
            showError.value = "Accept terms and conditions"
            return
        }
        
        model?.addUser(name: name, email: email, password: password) { errorResult in
            switch errorResult {
            case .success:
                print("created user bro")
            case .failure(let error):
                showError.value = error.localizedDescription
            }
        }
    }
}
