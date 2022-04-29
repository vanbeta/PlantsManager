//
//  MainScreenViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 28.04.2022.
//

import UIKit

class MainScreenViewController: UIViewController, Storybordable {
    
    
    let idCell = "mainCell"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.title = "My plants"
    
    }
}

extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MainTableViewCell
        cell.plantName.text = "heromantia"
        cell.plantImage?.image = UIImage(named: "flower")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("her")
    }
}
