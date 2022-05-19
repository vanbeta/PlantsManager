//
//  PagePlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 12.05.2022.
//

import UIKit

class PagePlantViewController: UIViewController, Storybordable, UIScrollViewDelegate {
    
    
    @IBOutlet weak var viewLastWatering: UIView!
    @IBOutlet weak var viewNextWatering: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labeLastWatering: UILabel!
    @IBOutlet weak var labeNextWatering: UILabel!
    
    var coordinator: AppCoordinator?
    var viewModel: PagePlantViewModelDelegate?
    
    var modelRecomendations = Recomendations()
    var modelPlant: Plant?
    
    let idCell = "recomendationsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        settingsGroupBoxView(viewLastWatering)
        settingsGroupBoxView(viewNextWatering)
        
        mainImage.image = UIImage(named: "mainImage")
        mainImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        modelRecomendations.createRecomendations() //!!!
        bindPlant()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make the Navigation Bar background transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = .white
        // Remove 'Back' text and Title from Navigation Bar
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = ""
    }
    
    func bindPlant() {
        viewModel?.getPlant.bind { plant in
            DispatchQueue.main.async {
                self.modelPlant = plant.first
                self.updatePage()
            }
        }
    }
    
    func updatePage() {
        self.name.text = self.modelPlant?.name
        self.labeLastWatering.text = dateFormatter(date: self.modelPlant?.lastWatering)
    }
    
    func dateFormatter(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        var result = "No watering"
        if !(date == nil) { result = dateFormatter.string(from: date!) }
        return result
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
        cell.configure(with: modelRecomendations.recomendations[indexPath.row])
        return cell
    }
}
