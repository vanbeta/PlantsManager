//
//  FullRecomendations.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 22.05.2022.
//

import UIKit

struct FullRecomentadion{
    
    
    var image: UIImage
    var color: UIColor
    var title: String
}

class FullRecomentadions {
    
    
    var fullRecomentadions: [FullRecomentadion] = []
    
    init () {
        createRecomendations()
    }
    
    func createRecomendations() {
        fullRecomentadions.append( FullRecomentadion( image: UIImage(named: "water")!,
                                                      color: UIColor(red: 0.91, green: 0.95, blue: 0.96, alpha: 1.00),
                                                      title: "WATER"))
        fullRecomentadions.append( FullRecomentadion( image: UIImage(named: "soil")!,
                                                      color: UIColor(red: 1.00, green: 0.91, blue: 0.85, alpha: 1.00),
                                                      title: "SOIL" ))
        fullRecomentadions.append( FullRecomentadion( image: UIImage(named: "light")!,
                                                      color: UIColor(red: 1.00, green: 0.95, blue: 0.80, alpha: 1.00),
                                                      title: "LIGHT"))
        fullRecomentadions.append( FullRecomentadion( image: UIImage(named: "temprature")!,
                                                      color: UIColor(red: 0.91, green: 0.96, blue: 0.92, alpha: 1.00),
                                                      title: "TEMPRATURE"))
    }
}
