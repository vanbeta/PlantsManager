//
//  Coordinator.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

protocol Coordinator {
    
    
    var navigationController: UINavigationController { get set }
    func start()
}
