//
//  CreateAccountViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation
import UIKit

class CreateAccountViewModel {

    
    var model: Users?
    var shouldShowAlert = Dynamic(("", ""))
    
    func setModel(model: Users) {
        self.model = model
    }
}

extension CreateAccountViewModel: CreateAccountDelegate {

    
    var getShouldShowAlert: Dynamic<(String, String)> {
        return shouldShowAlert
    }
                    
    func getTerms() {
        getShouldShowAlert.value = ("Terms", "We need your soul!")
    }
    
    func getConditions() {
        getShouldShowAlert.value = ("Conditions", "And all your money!")
    }
}
