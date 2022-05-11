//
//  AddPlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class AddPlantViewModel {
    
    
    var model: PlantsDataManager?
    
    func setModel(model: PlantsDataManager) {
        self.model = model
    }

}

extension AddPlantViewModel: AddPlantDelegate {
    
    
    func btnAddWasPressed() {
        let plant = Plant(name: "Ivan molodec", waterStatus: true, waterVolume: 200)
        model?.save(plant: plant)
    }
}
