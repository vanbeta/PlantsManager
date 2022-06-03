//
//  PagePlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import Foundation

class PagePlantViewModel {
    
    
    weak var coordinator: AppCoordinator?
    weak var model: PlantsDataManager?
    var plant: Dynamic<[Plants]> = Dynamic([])
    var id: ObjectIdentifier?

    init (id: ObjectIdentifier) {
           self.id = id
       }
    
    func setModel(model: PlantsDataManager) {
        self.model = model
        self.model?.updatePlants()
        
        let arr = [self.model!.fetchPlants().first(where: {$0.id == self.id})!]
        
        self.plant.value = arr
    }
    
}

extension PagePlantViewModel: PagePlantViewModelDelegate {
    
    
    var getPlant: Dynamic<[Plants]> { plant }
    
    func removePlant() {
        model?.removePlant(id: self.id!)
    }
    
    func getFullRecomentadions() -> [FullRecomentadion] {
        let modelFull = FullRecomentadions()
        return modelFull.fullRecomentadions
    }

    func btnDelPressed() {
        self.coordinator?.showMainScreen()
    }
    
    func btnEditPressed() {
        self.coordinator?.showAddPlant(edit: true, currentPlant: plant.value.first!)
    }
}
