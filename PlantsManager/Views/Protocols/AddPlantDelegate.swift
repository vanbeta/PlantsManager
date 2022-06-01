//
//  AddPlantDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation

protocol AddPlantDelegate: AnyObject {
    
    func btnAddWasPressed()
    func tablePressed(str: String)
    func gerRecomedation() -> AddRecomendation
}
