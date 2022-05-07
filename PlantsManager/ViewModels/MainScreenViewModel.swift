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
    
    func setModel(model: [Plant]) {
        self.model.value = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
    
    var getPlants: Dynamic<[Plant]> { model }

    func btnAddWasPressed() {
        coordinator?.showAddPlant()
    }
}
