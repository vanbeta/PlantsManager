//
//  MainScreenViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 28.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController, Storybordable {
    
    
    weak var coordinator: AppCoordinator?
    var viewModelDelegate: MainScreenDelegate?
    
    let idCell = "mainCell"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.title = "My plants"
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        let btnAdd = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(btnAddClicked))
        navigationItem.rightBarButtonItem = btnAdd
}
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDel = UIContextualAction(style: .normal, title: "") { action, view, success in
            // реализовать удаление
        }
        swipeDel.backgroundColor = UIColor.white
        swipeDel.image = UIImage(named: "remove")
 
        let swipeAction = UISwipeActionsConfiguration(actions: [swipeDel])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
    @objc func btnAddClicked() {
        coordinator?.showAddPlant()
    }
}

extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MainTableViewCell
        cell.plantName.text = "Bunny Boom Orhidec"
        cell.plantImage?.image = UIImage(named: "flower")
        cell.waterImage?.image = UIImage(named: "leica")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // реализовать клик на ячейку
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
}

extension MainScreenViewController: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // реализовать поиск
    }
}
