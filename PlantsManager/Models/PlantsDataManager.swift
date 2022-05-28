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
    var waterVolume: Int
    var recomendations: [Recomendation]
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
    
    
    var model: [Plants] = []
    
    init() {
        self.model = fetchPlants()
    }
    
    func save(plant: Plant) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

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
        savePlant.waterVolume = Int64(plant.waterVolume)
        savePlant.color = plant.color

        savePlant.recomendations = NSSet(array: allRecomendatios)
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchPlants() -> [Plants] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Plants> = Plants.fetchRequest()

        do {
            let data = try context.fetch(fetchRequest)
            return data
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
        
        if let users = try? context.fetch(fetchRequest) {
            context.delete(users.first { $0.id == id }!)
        }

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        updatePlants()
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
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        updatePlants()
    }
}
