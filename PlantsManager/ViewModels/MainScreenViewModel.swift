//
//  MainScreenViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class MainScreenViewModel {
    
    
    weak var coordinator: AppCoordinator?
    var model: Dynamic<[Plant]> = Dynamic([])

    func setModel(model: PlantsDataManager) {
        self.model.value = model.model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
        
    var getPlants: Dynamic<[Plant]> { model }

    func btnAddWasPressed() {
        coordinator?.showAddPlant()
    }
    func removePlant(index: Int) {
//        self.model.value.remove(at: index)
//        PlantsDataManager.shared.removePlant(index: index)
    }
}
