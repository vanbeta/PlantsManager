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
        let colors = [UIColor(red: 0.91, green: 0.96, blue: 0.92, alpha: 1.00),
                      UIColor(red: 0.91, green: 0.95, blue: 0.96, alpha: 1.00),
                      UIColor(red: 0.91, green: 0.93, blue: 0.96, alpha: 1.00),
                      UIColor(red: 0.95, green: 0.96, blue: 0.91, alpha: 1.00),
                      UIColor(red: 0.96, green: 0.93, blue: 0.91, alpha: 1.00)]
        
        contentView.backgroundColor = colors.randomElement()
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        self.selectionStyle = .none
    }
    
    func configure(with plant: Plant, cellIndex: Int) {
        self.plantName.text = plant.name
        self.plantImage?.image = UIImage(named: "flower")
        self.waterImage?.image = UIImage(named: "leica")
        self.waterLabel?.text = String(" - \(plant.waterVolume) ml")
        self.btnCheckMark.isSelected = plant.waterStatus
        
        btnCheckMark.setImage(UIImage(named:"checkedCheckMark"), for: .normal)
        btnCheckMark.setImage(UIImage(named:"uncheckedCheckMark"), for: .selected)
        btnCheckMark.tag = cellIndex
    }
    
    @IBAction func btnCheckMarkPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.viewModel?.changeCheckMarkWater(at: sender.tag)
    }
}


