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
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
        
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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let btnBack = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = btnBack

        let btnExtra = UIBarButtonItem(title: "", image: UIImage(named: "dots"), primaryAction: nil, menu: menu)
        navigationItem.rightBarButtonItem = btnExtra

//        let imgBackArrow = UIImage(named: "light")
//        navigationController?.navigationBar.backIndicatorImage = imgBackArrow
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBackArrow
    }
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Edit", image: UIImage(named: "edit"), handler: { (_) in
            }),
            UIAction(title: "Delete..", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { (_) in
                    self.showRemoveAlert(with: "", and: "Would you like to delete this plant", { [self] Ok in
                    if Ok {
                        self.viewModel?.removePlant()
                        self.coordinator?.showMainScreen()
                    } else {
                    }
                })
            })
        ]
    }

    var menu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
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
