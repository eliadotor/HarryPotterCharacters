//
//  CollectionViewCell.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import UIKit
import Kingfisher


struct CollectionCellViewModel {
    let imageUrl: URL?
    let name: String
    let house: String
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellCollectionImage: UIImageView!
    
    @IBOutlet weak var cellCollectionLabel: UILabel!
    
    func configure(with viewModel: CollectionCellViewModel) {
        
        cellCollectionLabel.text = viewModel.name
        cellCollectionImage.kf.setImage(with: viewModel.imageUrl, placeholder: UIImage(named: viewModel.house))
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .init(width: 2.0, height: 3.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
    }
}
