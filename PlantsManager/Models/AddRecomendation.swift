//
//  AddRecomendation.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 31.05.2022.
//

import Foundation
import UIKit

struct addCell {
    
    
    var mainImage: UIImage
    var mainTitle: String
    var selectedTitle: String
    var moreForRecomendation: [String]
}

class AddRecomendation {
    
    
    var addRecomendations: [addCell] = []
    
    init () {
        createAddRecomendationCell()
    }
    
    func createAddRecomendationCell () {
        addRecomendations.append(addCell(mainImage: UIImage(named: "waterCell")!, mainTitle: "Water", selectedTitle: "400 ml", moreForRecomendation: getWater()))
        addRecomendations.append(addCell(mainImage: UIImage(named: "soilCell")!, mainTitle: "Soil", selectedTitle: "Sandy", moreForRecomendation: getSoil()))
        addRecomendations.append(addCell(mainImage: UIImage(named: "lightCell")!, mainTitle: "Light", selectedTitle: "Need sun", moreForRecomendation: getLight()))
        addRecomendations.append(addCell(mainImage: UIImage(named: "tempratureCell")!, mainTitle: "Temprature", selectedTitle: "20-25℃", moreForRecomendation: getTemprature()))
    }
    
    func getWater() -> [String] {
        return ["100 ml", "200 ml", "300 ml", "400 ml"]
    }
    
    func getSoil() -> [String] {
        return ["Sandy soil", "Silt soil", "Clay Soil", "Loamy soil"]
    }
    
    func getLight() -> [String] {
        return ["Need sun", "Need more sun" ,"Unpretentious"]
    }
    
    func getTemprature() -> [String] {
        return ["0-10℃", "10-20℃", "20-30℃", "30-40℃"]
    }
}
