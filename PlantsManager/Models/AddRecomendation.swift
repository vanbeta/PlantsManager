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
}

class AddRecomendation {
    
    
    var addRecomendations: [addCell] = []
    
    init () {
        createAddRecomendationCell()
    }
    
    func createAddRecomendationCell () {
        addRecomendations.append(addCell(mainImage: UIImage(named: "waterCell")!, mainTitle: "Water", selectedTitle: "400 ml"))
        addRecomendations.append(addCell(mainImage: UIImage(named: "soilCell")!, mainTitle: "Soil", selectedTitle: "Sandy"))
        addRecomendations.append(addCell(mainImage: UIImage(named: "lightCell")!, mainTitle: "Light", selectedTitle: "Need sun"))
        addRecomendations.append(addCell(mainImage: UIImage(named: "tempratureCell")!, mainTitle: "Temprature", selectedTitle: "20-25℃"))
    }
}
