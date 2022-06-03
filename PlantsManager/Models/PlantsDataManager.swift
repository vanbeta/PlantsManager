//
//  Plants.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation
import UIKit
import CoreData

struct Plant {
    
    
    var color: UIColor
    var lastWatering: Date?
    var name: String
    var waterStatus: Bool
    var waterVolume: String
    var recomendations: [Recomendation]
    var descriptionPlant: String
}

struct Recomendation {
    
    
    enum RecomendationType: String {
        case water = "WATER"
        case light = "LIGHT"
        case soil = "SOIL"
        case temprature = "TEMPRATURE"
    }
    
    var period: String
    var title: RecomendationType
}


class PlantsDataManager {
    
    
    private var model: [Plants] = []
     var currentUserEmail = ""
    
    init(currentUserEmail: String) {
        self.currentUserEmail = currentUserEmail
        self.model = fetchPlants()
    }
    
    func setCurrentUserEmail(email: String) {
        self.currentUserEmail = email
    }
    
    func save(plant: Plant, emailUser: String, statusEdit: Bool, id: ObjectIdentifier) {
        if statusEdit {
            updateToBD(plant: plant, emailUser: emailUser, id: id)
        } else {
            saveWorker(plant: plant, emailUser: emailUser)
        }
     }
    
    func saveWorker(plant: Plant, emailUser: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()

        do {
            let data = try context.fetch(fetchRequest)
            guard let currentUser = (data.first { $0.email! == emailUser }) else {
                print("Not found current user")
                return
            }
            guard let entity = NSEntityDescription.entity(forEntityName: "Recomendations", in: context) else { return }
       
            var allRecomendatios = [Recomendations]()
            for recomend in plant.recomendations {
                let one = Recomendations(entity: entity, insertInto: context)
                one.title = recomend.title.rawValue
                one.period = recomend.period
                allRecomendatios.append(one)
            }
            
            guard let entityPlant = NSEntityDescription.entity(forEntityName: "Plants", in: context) else { return }
            
            let savePlant = Plants(entity: entityPlant, insertInto: context)

            savePlant.name = plant.name
            savePlant.waterStatus = plant.waterStatus
            savePlant.waterVolume = plant.waterVolume
            savePlant.color = plant.color
            savePlant.user = currentUser
            savePlant.descriptionPlant = plant.descriptionPlant

            savePlant.recomendations = NSSet(array: allRecomendatios)
                    
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
         } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func updateToBD(plant: Plant, emailUser: String, id: ObjectIdentifier) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Plants> = Plants.fetchRequest()

        if let plants = try? context.fetch(fetchRequest) {
            let user = plants.first { $0.id == id }!
            
            user.name = plant.name
            user.waterStatus = plant.waterStatus
            user.waterVolume = plant.waterVolume
            user.descriptionPlant = plant.descriptionPlant
            
            for recomend in user.recomendations! {
                (recomend as! Recomendations).period = plant.recomendations.first(where: { $0.title.rawValue == (recomend as! Recomendations ).title!})?.period
            }
        }
        do {
            try context.save()
            updatePlants()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchPlants() -> [Plants] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Users> = Users.fetchRequest()

        do {
            let data = try context.fetch(fetchRequest)
            let currentUser = data.first { $0.email == currentUserEmail }
            if currentUser == nil {
                return []
            }
            return currentUser!.plants!.allObjects as! [Plants]
        } catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    func updatePlants() {
        model = fetchPlants()
    }
    
    func getPlants() -> [Plants] {
        return model
    }
    
    func removePlant(id: ObjectIdentifier) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Plants> = Plants.fetchRequest()
        
        if let plants = try? context.fetch(fetchRequest) {
            context.delete(plants.first { $0.id == id }!)
        }
        
        do {
            try context.save()
            updatePlants()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
    func changeWaterStatus(id: ObjectIdentifier) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Plants> = Plants.fetchRequest()
        
        if let plants = try? context.fetch(fetchRequest) {
            let user = plants.first { $0.id == id }!
            user.waterStatus.toggle()
            user.lastWatering = Date()
        }
        do {
            try context.save()
            updatePlants()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
