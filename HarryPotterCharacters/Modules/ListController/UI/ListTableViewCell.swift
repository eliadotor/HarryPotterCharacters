//
//  ListTableCellViewModel.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import UIKit
import Kingfisher

struct ListTableCellViewModel {
    let imageUrl: URL?
    let name: String
    let house: String
}

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!

    @IBOutlet weak var cellLabel: UILabel!
    
    func configure(viewModel: ListTableCellViewModel) {
        cellLabel.text = viewModel.name
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: viewModel.imageUrl, placeholder: UIImage(named: viewModel.house))
    }

}
