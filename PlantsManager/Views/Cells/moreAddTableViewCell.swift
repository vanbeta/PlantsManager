//
//  moreAddTableViewCell.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 01.06.2022.
//

import UIKit


class moreAddTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(str: String) {
        mainLabel.text = str
    }
}
