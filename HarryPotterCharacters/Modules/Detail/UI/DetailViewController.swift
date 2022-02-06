//
//  DetailViewController.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import UIKit
import Kingfisher

enum Houses: String {
    case Gryffindor = "Gryffindor"
    case Slytherin = "Slytherin"
    case Hufflepuff = "Hufflepuff"
    case Ravenclaw = "Ravenclaw"
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
    
    @IBOutlet weak var nameLabelActor: UILabel!  {
        didSet {
            nameLabelActor.text = "detail_actor_label".localized
        }
    }
    
    @IBOutlet weak var nameActor: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "detail_date_label".localized
        }
    }
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var patronusLabel: UILabel! {
        didSet {
            patronusLabel.text = "detail_patronus_label".localized
        }
    }
    
    @IBOutlet weak var patronus: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closePressed(_ sender: Any) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    var presenter: DetailPresenterContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
    }
}


extension DetailViewController: DetailViewContract {
    
    func configure(with viewModel: DetailViewModel) {
        var color : UIColor {
            switch viewModel.house {
            case Houses.Gryffindor.rawValue: return UIColor(named: "Gryffindor") ?? UIColor.systemRed
            case Houses.Slytherin.rawValue: return UIColor(named: "Slytherin") ?? UIColor.systemGreen
            case Houses.Hufflepuff.rawValue: return UIColor(named: "Hufflepuff") ?? UIColor.systemYellow
            case Houses.Ravenclaw.rawValue: return UIColor(named: "Ravenclaw") ?? UIColor.systemBlue
            default:
                return UIColor.black
            }
        }
        
        DispatchQueue.main.async { [self] in
            self.detailImage.kf.setImage(with: viewModel.imageUrl, placeholder: UIImage(named: viewModel.house))
            closeButton.imageView?.backgroundColor = color
            closeButton.imageView?.layer.cornerRadius = 25
            nameCharacter.text = "\(viewModel.name) - "
            labelHouse.text = viewModel.house
            labelHouse.textColor = color
            nameActor.text = viewModel.actor
            patronus.text = viewModel.patronus
            date.text = viewModel.dateOfBirth
        }
    }
}
