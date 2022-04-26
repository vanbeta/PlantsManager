//
//  CreateAccountOutputDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 21.04.2022.
//

import Foundation
import UIKit

protocol CreateAccountDelegate: AnyObject {
    
    
    var getShowAlert: Dynamic<(String, String)> { get }
    var getShowError: Dynamic<String> { get }
    func getTerms()
    func getConditions()
    func createAccount(name: String, email: String, password: String)
}
		
