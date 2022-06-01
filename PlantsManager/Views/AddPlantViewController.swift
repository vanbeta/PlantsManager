//
//  AddPlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import UIKit

class AddPlantViewController: UIViewController, Storybordable {
    

    @IBOutlet weak var recomendationTable: UITableView!
    @IBOutlet weak var photoView: UIImageView!
    
    var viewModel: AddPlantDelegate?
        
    let idCell = "mainCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recomendationTable.dataSource = self
        recomendationTable.delegate = self
                
        photoView.image = UIImage(named: "photo")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let btnBack = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = btnBack
        
        recomendationTable.reloadData()
    }


}

extension AddPlantViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! addTableViewCell

        let arr = viewModel!.gerRecomedation().addRecomendations
        cell.configure(data: arr[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arr = viewModel!.gerRecomedation().addRecomendations

        viewModel?.tablePressed(str: arr[indexPath.row].mainTitle)
    }
}
