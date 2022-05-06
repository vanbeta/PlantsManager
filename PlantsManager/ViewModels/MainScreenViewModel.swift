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
    var tempModel: [Plant]?
    
    
    func setModel(model: [Plant]) {
        self.tempModel = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
    
    var getPlants: Dynamic<[Plant]> { model }
    
    func updateModel() {
        self.model.value = self.tempModel!
    }

    func btnAddWasPressed() {
        coordinator?.showAddPlant()
    }
}
