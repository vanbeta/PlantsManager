//
//  MainScreenDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


protocol MainScreenDelegate: AnyObject {
    

    var getPlants: Dynamic<[Plants]> { get }
    func addWasPressed()
    func removePlant(id: ObjectIdentifier)
    func changeCheckMarkWater(at index: Int)
    func plantPressed(id: ObjectIdentifier)
    func logOut()
}
