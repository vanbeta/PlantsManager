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
        let one = Recomendation(period: "one", title: .water)
        let two = Recomendation(period: "two", title: .light)
        let three = Recomendation(period: "three", title: .soil)
        let four = Recomendation(period: "for", title: .temprature)

        let setRecomendation = [one, two, three, four]

        let plant = Plant(color: colors.randomElement()!, lastWatering: nil, name: "Ivan", waterStatus: true, waterVolume: 123, recomendations: setRecomendation)
        
        self.model?.save(plant: plant)
    }
}
