//
//  AddPlantDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation

protocol AddPlantDelegate: AnyObject {
    
    func tablePressed(str: String)
    func gerRecomedation() -> AddRecomendation
    func cancelAddPlant()
    func donePressed(name: String, descriptionPlant: String)
    func getName() -> String
    func getDescription() -> String
}
