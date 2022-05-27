//
//  PagePlantViewModelDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import Foundation


protocol PagePlantViewModelDelegate: AnyObject {
    
    
    var getPlant: Dynamic<[Plants]> { get }
    func removePlant()
    func getFullRecomentadions() -> [FullRecomentadion]
}
