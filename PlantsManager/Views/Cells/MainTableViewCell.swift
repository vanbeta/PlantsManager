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
    @IBOutlet weak var btnCheckMark: UIButton!
    
    var viewModel: MainScreenDelegate?
        
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.size.height -= 20
            super.frame = frame
        }
    }
        
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        self.selectionStyle = .none
    }
    
    func configure(with plant: Plant, cellIndex: Int) {
        plantName.text = plant.name
        plantImage?.image = UIImage(named: "flower")
        waterImage?.image = UIImage(named: "leica")
        waterLabel?.text = String(" - \(plant.waterVolume) ml")
        btnCheckMark.isSelected = plant.waterStatus
        
        btnCheckMark.setImage(UIImage(named:"checkedCheckMark"), for: .normal)
        btnCheckMark.setImage(UIImage(named:"uncheckedCheckMark"), for: .selected)
        
        contentView.backgroundColor = plant.color.uiColor
        
        btnCheckMark.tag = cellIndex
    }
    
    @IBAction func btnCheckMarkPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        viewModel?.changeCheckMarkWater(at: sender.tag)
    }
}


