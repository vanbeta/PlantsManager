//
//  MainScreenViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 28.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController, Storybordable {
    
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var viewModel: MainScreenDelegate?
    
    private var plants: [Plants] = []

    private let search = UISearchController(searchResultsController: nil)
    private var filteredPlants = [Plants]()
    private var searchBarIsEmpty: Bool {
        guard let text = search.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return search.isActive && !searchBarIsEmpty
    }
    
    let idCell = "mainCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        tableView.delegate = self
        
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        search.searchBar.placeholder = "Search"
        
        let btnAccount = UIBarButtonItem(title: "Log out",
                                         style: .plain,
                                         target: self,
                                         action: #selector(btnLogOutClicked))
        navigationItem.rightBarButtonItem = btnAccount
        
        btnAdd.setImage(UIImage(named: "add"), for: .normal)

        bindPlants()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "My plants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
                    viewModel?.removePlant(id: plants[indexPath.item].id)
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

    @IBAction func btnAddPressed(_ sender: Any) {
        viewModel?.addWasPressed()
    }
    
    @objc func btnLogOutClicked() {
        viewModel?.logOut()
    }
}

extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPlants.count
        }
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MainTableViewCell
        cell.viewModel = self.viewModel
        
        var plant: Plants

        if isFiltering {
            plant = filteredPlants[indexPath.row]
        } else {
            plant = plants[indexPath.row]
        }
        
        cell.configure(with: plant, cellIndex: indexPath.row)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            viewModel?.plantPressed(id: filteredPlants[indexPath.row].id)
        } else {
            viewModel?.plantPressed(id: plants[indexPath.item].id)
        }
    }
}

extension MainScreenViewController: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredPlants = plants.filter({ (plant: Plants) -> Bool in
            return plant.name!.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
