//
//  Plants.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


struct Plant: Codable {
    
    
    var id = UUID()
    var name: String
    var waterStatus: Bool = false
    var waterVolume: Int
    var lastWatering: Date?
}

class PlantsDataManager {
    
    
    var model: [Plant] = []
    
    private let userDefaults = UserDefaults.standard
    private let plantKey = "newPlantList"
    
    init() {
        self.model = fetchPlants()
    }
    
    func save(plant: Plant) {
        model.append(plant)
        guard let data = try? JSONEncoder().encode(model) else { return }
        userDefaults.set(data, forKey: plantKey)
        model = fetchPlants()
    }
    
    func fetchPlants() -> [Plant] {
        guard let data = userDefaults.object(forKey: plantKey) as? Data else { return [] }
        guard let plants = try? JSONDecoder().decode([Plant].self, from: data) else { return [] }

        return plants
    }
    
    func removePlant(id: UUID) {
        var plants = fetchPlants()
        plants.removeAll(where: {$0.id == id})
        guard let data = try? JSONEncoder().encode(plants) else { return }
        userDefaults.set(data, forKey: plantKey)
        model = fetchPlants()
    }

    func changeWaterStatus(at index: Int) {
        var plants = fetchPlants()
        var plant = plants.remove(at: index)
        plant.waterStatus.toggle()
        plant.lastWatering = Date()
        plants.insert(plant, at: index)
        guard let data = try? JSONEncoder().encode(plants) else { return }
        userDefaults.set(data, forKey: plantKey)
        model = fetchPlants()
    }
}
