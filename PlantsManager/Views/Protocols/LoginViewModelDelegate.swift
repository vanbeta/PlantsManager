//
//  LoginViewModelDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 25.04.2022.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    
    
    var getShowError: Dynamic<String> { get }
    func checkAccess(email: String, password: String)
    func btnCreareAccountWasPressed()
}
