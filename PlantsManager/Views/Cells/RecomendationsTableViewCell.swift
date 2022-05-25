//
//  RecomendationsTableViewCell.swift
//  PlantsManager
//
//  Created by Ivan Poderegin on 15.05.2022.
//

import UIKit

class RecomendationsTableViewCell: UICollectionViewCell {
    
    var viewModel: PagePlantViewModelDelegate?
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var period: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 13
        contentView.layer.masksToBounds = true
    }
    
    func configure(with recomendation: Recomendation) {
        let fullRecomentadions = viewModel?.getFullRecomentadions().first { $0.title == recomendation.title.rawValue }
        mainImage?.image = fullRecomentadions?.image
        mainTitle?.text = fullRecomentadions?.title
        period?.text = recomendation.period
        contentView.backgroundColor = fullRecomentadions?.color
    }
}
