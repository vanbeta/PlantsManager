//
//  Plants.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


struct Plant: Codable {
    
    
    var name: String
    var waterStatus: Bool = false
    var waterVolume: Int
}

class PlantsDataManager {
    static let shared = PlantsDataManager()
    
    private let userDefaults = UserDefaults.standard
    private let plantKey = "newPlantList"
    
    private init() {}
    
    func save(plant: Plant) {
        var plants = fetchPlants()
        plants.append(plant)
        
        guard let data = try? JSONEncoder().encode(plants) else { return }
        userDefaults.set(data, forKey: plantKey)
    }
    
    func fetchPlants() -> [Plant] {
        guard let data = userDefaults.object(forKey: plantKey) as? Data else { return [] }
        guard let plants = try? JSONDecoder().decode([Plant].self, from: data) else { return [] }

        return plants
    }

    func changeWaterStatus(at index: Int) {
        var plants = fetchPlants()
        var plant = plants.remove(at: index)
        plant.waterStatus.toggle()
        plants.insert(plant, at: index)

        guard let data = try? JSONEncoder().encode(plants) else { return }
        userDefaults.set(data, forKey: plantKey)
    }
}
