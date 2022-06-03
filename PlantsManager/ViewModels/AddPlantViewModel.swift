//
//  AddPlantViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation
import UIKit
import CoreData

class AddPlantViewModel {
    
    
    weak var userModel: UsersDataManager?
    weak var model: PlantsDataManager?
    weak var coordinator: AppCoordinator?
    var plant: Plants?
    
    let addRecomendation = AddRecomendation()
    
    var editStatus: Bool?
    
    init(edit status: Bool, plant: Plants){
        editStatus = status
        self.plant = plant
        
        if editStatus! {
            let recomend = plant.recomendations?.allObjects as! [Recomendations]
            for value in addRecomendation.addRecomendations  {
                var new = value
                new.selectedTitle = recomend.first { $0.title!.lowercased() == value.mainTitle.lowercased()}!.period!
                let index = addRecomendation.addRecomendations.firstIndex {$0.mainTitle == new.mainTitle}
                addRecomendation.addRecomendations.remove(at: index!)
                addRecomendation.addRecomendations.insert(new, at: index!)
            }
        }
    }
    
    let colors = [UIColor(red: 0.91, green: 0.96, blue: 0.92, alpha: 1.00),
                  UIColor(red: 0.91, green: 0.95, blue: 0.96, alpha: 1.00),
                  UIColor(red: 0.91, green: 0.93, blue: 0.96, alpha: 1.00),
                  UIColor(red: 0.95, green: 0.96, blue: 0.91, alpha: 1.00),
                  UIColor(red: 0.96, green: 0.93, blue: 0.91, alpha: 1.00)]
    
    func setModel(model: PlantsDataManager) {
        self.model = model
    }
    
    func setUserModel(model: UsersDataManager) {
        self.userModel = model
    }
    
    func formingRecomend(type: Recomendation.RecomendationType) -> String {
        return gerRecomedation().addRecomendations.first { $0.mainTitle.lowercased() == type.rawValue.lowercased() }!.selectedTitle
    }
}

extension AddPlantViewModel: AddPlantDelegate {
    
    
    func tablePressed(str: String) {
        coordinator?.showRecommendation(str: str, model: gerRecomedation())
    }
    
    func gerRecomedation() -> AddRecomendation {
        return addRecomendation
    }
    
    func cancelAddPlant() {
        coordinator?.showMainScreen()
    }
    
    func donePressed(name: String, descriptionPlant: String) {
        let one = Recomendation(period: formingRecomend(type: .water), title: .water)
        let two = Recomendation(period: formingRecomend(type: .light), title: .light)
        let three = Recomendation(period: formingRecomend(type: .soil), title: .soil)
        let four = Recomendation(period: formingRecomend(type: .temprature), title: .temprature)

        let setRecomendation = [one, two, three, four]

        let waterVolume = addRecomendation.addRecomendations.first { $0.mainTitle.lowercased() == Recomendation.RecomendationType.water.rawValue.lowercased() }!.selectedTitle
        
        let plant = Plant(color: colors.randomElement()!, lastWatering: nil, name: name, waterStatus: true, waterVolume: waterVolume, recomendations: setRecomendation, descriptionPlant: descriptionPlant)
        
        self.model?.save(plant: plant, emailUser: userModel?.fetchCurrentUser() ?? "", statusEdit: editStatus!, id: self.plant!.id)
        
        self.coordinator?.showMainScreen()
    }
    
    func getName() -> String {
        if editStatus! {
            return (plant?.name)!
        } else {
            return ""
        }
    }
    
    func getDescription() -> String {
        if editStatus! {
            return (plant?.descriptionPlant)!
        } else {
            return "Description"
        }
    }
}
