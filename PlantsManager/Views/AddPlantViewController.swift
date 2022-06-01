//
//  AddPlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import UIKit

class AddPlantViewController: UIViewController, Storybordable {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var viewDescription: UITextView!
    @IBOutlet weak var recomendationTable: UITableView!
    @IBOutlet weak var photoView: UIImageView!
    
    var viewModel: AddPlantDelegate?
    
    var recomendation: [addCell]?
    
    let idCell = "mainCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recomendationTable.dataSource = self
        recomendationTable.delegate = self
        
        recomendation = AddRecomendation().addRecomendations
        
//        photoView.image = UIImage(named: "photo")
    }


}

extension AddPlantViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! addTableViewCell

        cell.configure(data: (recomendation?[indexPath.row])!)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
