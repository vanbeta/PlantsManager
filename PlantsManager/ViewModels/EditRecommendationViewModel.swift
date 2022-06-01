//
//  EditRecommendationViewModel.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 01.06.2022.
//

import Foundation

class EditRecommendationViewModel {
    
    
    var maintModel: AddRecomendation?
}
    
extension EditRecommendationViewModel: EditRecommendationViewModelDelegate {
    
    
    func getAddRecomendations() -> [addCell] {
        return maintModel!.addRecomendations
    }

    func removeAddRecomendations(index: Int) {
        maintModel!.addRecomendations.remove(at: index)
    }
    
    func insertAddRecomendations(cell: addCell, index: Int) {
        maintModel!.addRecomendations.insert(cell, at: index)
    }
}
