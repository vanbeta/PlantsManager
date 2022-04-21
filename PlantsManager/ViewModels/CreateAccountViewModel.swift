//
//  CreateAccountViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import Foundation
import UIKit

class CreateAccountViewModel {

    
    
}

extension CreateAccountViewModel: CreateAccountDelegate {

    
    func getTerms(view: UIViewController) {
        showAlert(with: "Terms", and: "We need your soul!", view: view)
    }
    
    func getConditions(view: UIViewController) {
        showAlert(with: "Conditions", and: "And all your money!", view: view)
    }
    
    func showAlert(with title: String, and message: String, view: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
    }
}
