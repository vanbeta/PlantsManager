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
    var usersModel: UsersDataManager?

    func setModel(model: PlantsDataManager) {
        self.plants.value = model.model
        self.model = model
    }
    
    func setUsersModel(model: UsersDataManager){
        self.usersModel = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
            
    var getPlants: Dynamic<[Plant]> { self.plants }

    func addWasPressed() {
        coordinator?.showAddPlant()
    }
    
    func removePlant(id: UUID) {
        model?.removePlant(id: id)
        plants.value.removeAll(where: {$0.id == id})
    }
    
    func changeCheckMarkWater(at index: Int) {
        model?.changeWaterStatus(at: index)
        plants.value = (self.model?.fetchPlants())!
    }
    
    func plantPressed(id: UUID) {
        coordinator?.showPagePlant(id: id)
    }
    
    func logOut() {
        usersModel?.logOutUser()
        coordinator?.showLogin()
    }
}
