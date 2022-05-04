//
//  MainScreenViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import Foundation


class MainScreenViewModel {
    
    
    var model: [Plant]?
    
    func setModel(model: [Plant]) {
        self.model = model
    }
}

extension MainScreenViewModel: MainScreenDelegate {
    
    
    
}
