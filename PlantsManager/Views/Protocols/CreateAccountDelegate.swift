//
//  CreateAccountOutputDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 21.04.2022.
//

import Foundation
import UIKit

protocol CreateAccountDelegate: AnyObject {
    
    
    var getShouldShowAlert: Dynamic<(String, String)> { get }
    func getTerms()
    func getConditions()
}
		
