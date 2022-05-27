//
//  AddPlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation
import UIKit
import CoreData

class AddPlantViewModel {
    
    
    weak var model: PlantsDataManager?
    let colors = [UIColor(red: 0.91, green: 0.96, blue: 0.92, alpha: 1.00),
                  UIColor(red: 0.91, green: 0.95, blue: 0.96, alpha: 1.00),
                  UIColor(red: 0.91, green: 0.93, blue: 0.96, alpha: 1.00),
                  UIColor(red: 0.95, green: 0.96, blue: 0.91, alpha: 1.00),
                  UIColor(red: 0.96, green: 0.93, blue: 0.91, alpha: 1.00)]
    
    func setModel(model: PlantsDataManager) {
        self.model = model
    }
}

extension AddPlantViewModel: AddPlantDelegate {
    
    
    func btnAddWasPressed() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Recomendations", in: context) else { return }
        
        let three = Recomendations(entity: entity, insertInto: context)
        three.title = "WATER"
        three.period = "one"
        
        let four = Recomendations(entity: entity, insertInto: context)
        four.title = "LIGHT"
        four.period = "two"
        
        let five = Recomendations(entity: entity, insertInto: context)
        five.title = "SOIL"
        five.period = "three"
        
        let six = Recomendations(entity: entity, insertInto: context)
        six.title = "TEMPRATURE"
        six.period = "four"

        let mySet: NSSet = [three, four, five, six]
        
        guard let entityPlant = NSEntityDescription.entity(forEntityName: "Plants", in: context) else { return }

        let plant = Plants(entity: entityPlant, insertInto: context)
        
        plant.name = "Her"
        plant.waterStatus = true
        plant.waterVolume = 200
        plant.color = colors.randomElement()!
        
        plant.recomendations = mySet
        
        self.model?.save(plant: plant)
    }
}
