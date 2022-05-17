//
//  PagePlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import Foundation

class PagePlantViewModel {
    var model: PlantsDataManager?
    
    func setModel(model: PlantsDataManager) {
        self.model = model
    }
}

extension PagePlantViewModel: PagePlantViewModelDelegate {
    
    
}
