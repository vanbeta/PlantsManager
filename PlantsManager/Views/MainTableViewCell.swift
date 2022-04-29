//
//  MainTableViewCell.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 29.04.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var waterImage: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
