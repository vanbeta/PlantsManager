//
//  MainScreenDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


protocol MainScreenDelegate: AnyObject {
    

    var getPlants: Dynamic<[Plant]> { get }
    func btnAddWasPressed()
}
