//
//  MainScreenViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 28.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController, Storybordable {
    
    
    var viewModel: MainScreenDelegate?
    
    private var plants: [Plant] = []
    
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
                
        bindPlants()
    }
    
    func bindPlants() {
        viewModel?.getPlants.bind { value in
            DispatchQueue.main.async {
                self.plants = value
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDel = UIContextualAction(style: .normal, title: "") { [self] action, view, success in
            showRemoveAlert(with: "", and: "Would you like to delete this plant", { [self] Ok in
                if Ok {
                    viewModel?.removePlant(index: indexPath.item)
                    success(true)
                } else {
                    success(false)
                }
            })
        }
        swipeDel.backgroundColor = UIColor.white
        swipeDel.image = UIImage(named: "remove")
        
        let swipeAction = UISwipeActionsConfiguration(actions: [swipeDel])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
    @objc func btnAddClicked() {
        viewModel?.btnAddWasPressed()
    }
}

extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MainTableViewCell
        
        let plant = plants[indexPath.row]
        cell.configure(with: plant, cellIndex: indexPath.row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // реализовать клик на ячейку
    }
    
}

extension MainScreenViewController: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // реализовать поиск
    }
}
