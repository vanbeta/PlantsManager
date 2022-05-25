//
//  PagePlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import Foundation

class PagePlantViewModel {
    
    
    weak var model: PlantsDataManager?
    var plant: Dynamic<[Plant]> = Dynamic([])
    var id: UUID?
    
    init (id: UUID) {
        self.id = id
    }
    
    func setModel(model: PlantsDataManager) {
        self.model = model
        let arr = [self.model!.fetchPlants().first(where: {$0.id == self.id})!]
        self.plant.value = arr
    }
    
}

extension PagePlantViewModel: PagePlantViewModelDelegate {
    
    
    var getPlant: Dynamic<[Plant]> { plant }
    
    func removePlant() {
        model?.removePlant(id: self.id!)
    }
    
    func getFullRecomentadions() -> [FullRecomentadion] {
        let modelFull = FullRecomentadions() //!!
        return modelFull.fullRecomentadions
    }

}
