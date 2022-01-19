//
//  PlantsManagerViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 13.01.2022.
//

import UIKit

class PlantsManagerViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordFiled: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel() 
    }
    
    func bindViewModel() {
        viewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        }
        
        viewModel.statusColor.bind { statusColor in
            DispatchQueue.main.async {
                self.label.textColor = statusColor
            }
        }
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        viewModel.userButtonPressed(login: (loginField.text ?? ""), password: (passwordFiled.text ?? ""))
    }
}
