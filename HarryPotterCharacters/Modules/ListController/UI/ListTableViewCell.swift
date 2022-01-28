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
    let text: String
    let house: String
}

class ListTableViewCell: UITableViewCell {
    let imagenAlternativa = UIImage(systemName: "qrcode.viewfinder")
    @IBOutlet weak var cellImage: UIImageView!

    @IBOutlet weak var cellLabel: UILabel!
    
    func configure(viewModel: ListTableCellViewModel) {
        cellLabel.text = viewModel.text
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: viewModel.imageUrl, placeholder: UIImage(named: viewModel.house))
    }

}
