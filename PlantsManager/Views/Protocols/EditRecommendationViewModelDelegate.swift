//
//  EditRecommendationViewModelDelegate.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 01.06.2022.
//

import Foundation

protocol EditRecommendationViewModelDelegate: AnyObject {
    
    func getAddRecomendations() -> [addCell]
    func removeAddRecomendations(index: Int)
    func insertAddRecomendations(cell: addCell, index: Int)
}
