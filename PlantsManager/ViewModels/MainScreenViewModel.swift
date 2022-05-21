//
//  MainScreenViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class MainScreenViewModel {
    
    
    weak var coordinator: AppCoordinator?
    weak var model: PlantsDataManager?
    var plants: Dynamic<[Plant]> = Dynamic([])

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
    
    func removePlant(id: UUID) {
        self.model?.removePlant(id: id)
        self.plants.value.removeAll(where: {$0.id == id})
    }
    
    func changeCheckMarkWater(at index: Int) {
        self.model?.changeWaterStatus(at: index)
        self.plants.value = (self.model?.fetchPlants())!
    }
    
    func plantPressed(id: UUID) {
        coordinator?.showPagePlant(id: id)
    }
}
