//
//  PagePlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import UIKit

class PagePlantViewController: UIViewController, Storybordable, UIScrollViewDelegate {
 
    
    
//    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewLastWatering: UIView!
    @IBOutlet weak var viewNextWatering: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var coordinator: AppCoordinator?
    var viewModel: PagePlantViewModelDelegate?

    var her = Recomendations()

    let idCell = "recomendationsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        settingsGroupBoxView(viewLastWatering)
        settingsGroupBoxView(viewNextWatering)
        
        mainImage.image = UIImage(named: "mainImage")
        mainImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        her.createRecomendations() //!!!
    }
    
    func settingsGroupBoxView(_ view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.84, alpha: 1.00).cgColor
    }
}

extension PagePlantViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! RecomendationsTableViewCell
        
        cell.configure(with: her.recomendations[indexPath.row])
        
        //        if cell == nil {
        //            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        //        }
        
        //        cell.configure(with: Plant(name: "dd", waterStatus: true, waterVolume: 100), cellIndex: indexPath.row)
        
        return cell
    }
}
