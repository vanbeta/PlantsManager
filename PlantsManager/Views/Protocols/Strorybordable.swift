//
//  Strorybordable.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 14.04.2022.
//

import UIKit

protocol Storybordable {
    
    
    static func createObject() -> Self
}

extension Storybordable where Self: UIViewController {
    
    
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
    
}
