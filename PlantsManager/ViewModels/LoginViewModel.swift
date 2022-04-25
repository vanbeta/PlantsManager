//
//  LoginViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation

class LoginViewModel {
    
    
    var model: Users?
    
    func setModel(model: Users) {
        self.model = model
    }
}

extension LoginViewModel: LoginViewModelDelegate {
    
    
    func checkAccess(login: String, password: String) -> Bool {
        guard let model = model else {
            print("no model")
            return false
        }
        
        if model.logins.contains(where: { $0.login == login }) {
            if model.logins.first(where: {$0.password == password }) != nil {
                print("password is correct")
            } else {
                print("password is wrong")
            }
        } else {
            print("login not found")
        }

        return true
    }
}

