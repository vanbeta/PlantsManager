//
//  CreateAccountOutputDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 21.04.2022.
//

import Foundation
import UIKit

protocol CreateAccountDelegate: AnyObject {
    
    
    func getTerms(view: UIViewController)
    func getConditions(view: UIViewController)
    func showAlert(with title: String, and message: String, view: UIViewController)
}
