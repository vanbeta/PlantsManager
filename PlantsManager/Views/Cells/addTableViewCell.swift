//
//  addTableViewCell.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 31.05.2022.
//

import UIKit


class addTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var editLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: addCell) {
        editImage.image = UIImage(named: "more")
        mainImage.image = data.mainImage
        mainLabel.text = data.mainTitle
        editLabel.text = data.selectedTitle
    }
}
