//
//  AddPlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import UIKit

class AddPlantViewController: UIViewController, Storybordable {
    
    
    var viewModel: AddPlantDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAddPressed(_ sender: Any) {
        viewModel?.btnAddWasPressed()
    }
}
