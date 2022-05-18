//
//  PagePlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import Foundation

class PagePlantViewModel {
    
    
    var plant: Dynamic<[Plant]> = Dynamic([])
    
    func setModel(model: Plant) {
        let arr = [model]
        self.plant.value = arr
    }
    
}

extension PagePlantViewModel: PagePlantViewModelDelegate {
    
    
    var getPlant: Dynamic<[Plant]> { plant }
}
