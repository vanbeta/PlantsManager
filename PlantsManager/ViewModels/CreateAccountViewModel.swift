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
    var showAlert = Dynamic(("", ""))
    
    func setModel(model: Users) {
        self.model = model
    }
}

extension CreateAccountViewModel: CreateAccountDelegate {

    
    var getShowAlert: Dynamic<(String, String)> {
        return showAlert
    }
                    
    func getTerms() {
        getShowAlert.value = ("Terms", "We need your soul!")
    }
    
    func getConditions() {
        getShowAlert.value = ("Conditions", "And all your money!")
    }
}
