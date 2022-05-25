//
//  MainScreenDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


protocol MainScreenDelegate: AnyObject {
    

    var getPlants: Dynamic<[Plant]> { get }
    func addWasPressed()
    func removePlant(id: UUID)
    func changeCheckMarkWater(at index: Int)
    func plantPressed(id: UUID)
    func logOut()
}
