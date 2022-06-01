//
//  EditRecommendationViewController.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 01.06.2022.
//

import UIKit


class EditRecommendationViewController: UIViewController, Storybordable {
    
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: EditRecommendationViewModelDelegate?
    
    let idCell = "mainCell"
    var inName: String?
    var workModel: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        workModel = viewModel?.getAddRecomendations().first(where: { $0.mainTitle == inName! })?.moreForRecomendation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let btnBack = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = btnBack
    }
}

extension EditRecommendationViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! moreAddTableViewCell
        
        let arr = workModel
        cell.configure(str: arr![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var str = viewModel?.getAddRecomendations().first(where: { $0.mainTitle == inName! })
        let index = viewModel?.getAddRecomendations().firstIndex(where: { $0.mainTitle == inName! })
        
        let arr = workModel
        str?.selectedTitle = arr![indexPath.row]
        
        viewModel?.removeAddRecomendations(index: index!)
        viewModel?.insertAddRecomendations(cell: str!, index: index!)
    }
}
