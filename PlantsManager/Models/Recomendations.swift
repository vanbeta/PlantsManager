//
//  Recomendations.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 15.05.2022.
//

import Foundation
import UIKit

struct Recomendation {
    
    
    var image: UIImage
    var color: UIColor
    var title: String
    var period: String
}

class Recomendations {
    
    
    var recomendations: [Recomendation] = []
    
    init () {
        createRecomendations()
    }

    func createRecomendations() {
        recomendations.append( Recomendation(image: UIImage(named: "water")!, color: UIColor(red: 0.91, green: 0.95, blue: 0.96, alpha: 1.00), title: "WATER", period: "1 / WEEK") )
        recomendations.append( Recomendation(image: UIImage(named: "soil")!, color: UIColor(red: 1.00, green: 0.91, blue: 0.85, alpha: 1.00), title: "SOIL", period: "1 / WEEK") )
        recomendations.append( Recomendation(image: UIImage(named: "light")!, color: UIColor(red: 1.00, green: 0.95, blue: 0.80, alpha: 1.00), title: "LIGHT", period: "1 / WEEK") )
        recomendations.append( Recomendation(image: UIImage(named: "temprature")!, color: UIColor(red: 0.91, green: 0.96, blue: 0.92, alpha: 1.00), title: "TEMPRATURE", period: "1 / WEEK") )
    }
}
