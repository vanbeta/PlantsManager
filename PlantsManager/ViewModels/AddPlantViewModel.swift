//
//  AddPlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation
import UIKit

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
        let arrRecomendation = [Recomendation(title: Recomendation.titles.water, period: "one"),
                                Recomendation(title: Recomendation.titles.light, period: "two"),
                                Recomendation(title: Recomendation.titles.soil, period: "three"),
                                Recomendation(title: Recomendation.titles.temprature, period: "four")]
        
        let plant = Plant(name: "valer", waterStatus: true, waterVolume: 200, color: ColorWrapper(uiColor: colors.randomElement()!), recomendations: arrRecomendation)
        
        model?.save(plant: plant)
    }
}
