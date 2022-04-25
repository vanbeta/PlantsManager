//
//  LoginViewModelDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 25.04.2022.
//

import Foundation


protocol LoginViewModelDelegate: AnyObject {
    
    
    func checkAccess(login: String, password: String) -> Bool
}
