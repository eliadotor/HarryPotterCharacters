//
//  DetailViewController.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import UIKit
import Kingfisher

struct WandViewModel {
    let wood: String
    let core: String
}

struct DetailViewModel {
    let imageUrl: URL?
    let name: String
    let house: String
    let dateOfBirth: String
    let patronus: String
    let actor: String
}

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var labelHouse: UILabel!
    @IBOutlet weak var nameLabelActor: UILabel!
    @IBOutlet weak var nameActor: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    @IBOutlet weak var patronus: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(width: viewModel)
    }
    
    func configure(width viewModel: DetailViewModel?) {
        guard let viewModel = viewModel else { return }
        detailImage.kf.setImage(with: viewModel.imageUrl)
        nameCharacter.text = "\(viewModel.name) - "
        labelHouse.text = viewModel.house
        nameLabelActor.text = "Actor: "
        nameActor.text = viewModel.actor
        patronusLabel.text = "Patronus: "
        patronus.text = viewModel.patronus
        dateLabel.text = "Fecha de nacimiento: "
        date.text = viewModel.dateOfBirth
        
    }

}
