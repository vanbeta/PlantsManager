//
//  AddPlantViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 03.05.2022.
//

import UIKit

class AddPlantViewController: UIViewController, Storybordable {
    

    @IBOutlet weak var viewTable: UITableView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descriptionPlant: UITextView!
    
    
    var viewModel: AddPlantDelegate?
        
    let idCell = "mainCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTable.dataSource = self
        viewTable.delegate = self
                        
        photoView.image = UIImage(named: "photo")
        name.text = viewModel?.getName()
        descriptionPlant.text = viewModel?.getDescription()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let btnCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(btnCancelPressed))
        btnCancel.tintColor = .black
        self.navigationItem.leftBarButtonItem = btnCancel
        
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(btnDonePressed))
        self.navigationItem.rightBarButtonItem = btnDone
        
        let btnBack = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = btnBack
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Edit plant"
        
        viewTable.reloadData()
    }
    
    @objc
    func btnCancelPressed() {
        viewModel?.cancelAddPlant()
    }
    
    @objc
    func btnDonePressed() {
        guard !name.text!.isEmpty else { self.showAlert(with: "Error", and: "name is empty"); return}
        viewModel?.donePressed(name: name.text!, descriptionPlant: descriptionPlant.text)
    }
}

extension AddPlantViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.gerRecomedation().addRecomendations.count
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
