//
//  MainScreenViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class MainScreenViewModel {
    
    
    weak var coordinator: AppCoordinator?
    var plants: Dynamic<[Plant]> = Dynamic([])
    var model: PlantsDataManager?

    func setModel(model: PlantsDataManager) {
        self.plants.value = model.model
        self.model = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
        
    var getPlants: Dynamic<[Plant]> { plants }

    func btnAddWasPressed() {
        coordinator?.showAddPlant()
    }
    
    func removePlant(index: Int) {
        self.model?.removePlant(index: index)
        self.plants.value.remove(at: index)
    }
    
    func changeCheckMarkWater(at index: Int) {
        self.model?.changeWaterStatus(at: index)
    }
}
