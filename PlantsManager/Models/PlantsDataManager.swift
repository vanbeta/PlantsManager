//
//  Plants.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation
import UIKit
import CoreData


class PlantsDataManager {
    
    
    var model: [Plants] = []
    
    init() {
        self.model = fetchPlants()
    }
    
    func save(plant: Plants) {
        let context = plant.managedObjectContext!
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
