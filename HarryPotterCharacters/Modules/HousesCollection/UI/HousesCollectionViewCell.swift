//
//  HousesCollectionViewCell.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import UIKit


class HousesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var housesCellImage: UIImageView!
    
    func configure(with house: String) {
        housesCellImage.image =  UIImage(named: house)
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
}
