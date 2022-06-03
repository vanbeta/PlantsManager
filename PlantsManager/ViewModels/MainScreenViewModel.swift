//
//  MainScreenViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class MainScreenViewModel {
    
    
    weak var coordinator: AppCoordinator?
    weak var plantsModel: PlantsDataManager?
    weak var usersModel: UsersDataManager?
    var plants: Dynamic<[Plants]> = Dynamic([])

    func setUsersModel(model: UsersDataManager){
        self.usersModel = model
    }
    
    func setModel(model: PlantsDataManager) {
        self.plants.value = model.fetchPlants()
        self.plantsModel = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
            
    var getPlants: Dynamic<[Plants]> { self.plants }

    func addWasPressed() {
        coordinator?.showAddPlant(edit: false, currentPlant: Plants())
    }
    
    func removePlant(id: ObjectIdentifier) {
        plantsModel?.removePlant(id: id)
        plants.value.removeAll(where: {$0.id == id})
    }
    
    func changeCheckMarkWater(at index: Int) {
        plantsModel?.changeWaterStatus(id: plants.value[index].id)
        plants.value = (self.plantsModel?.fetchPlants())!
    }
    
    func plantPressed(id: ObjectIdentifier) {
        coordinator?.showPagePlant(id: id)
    }
    
    func logOut() {
        usersModel?.logOutUser()
        coordinator?.showLogin()
    }
}
