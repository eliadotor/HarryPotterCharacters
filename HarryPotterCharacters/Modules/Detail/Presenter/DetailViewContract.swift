//
//  DetailContract.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit

protocol DetailViewContract: UIViewController {
    var presenter: DetailPresenterContract? {set get}
    func configure(with viewModel: DetailViewModel)
}

protocol DetailPresenterContract: AnyObject {
    var view: DetailViewController? {set get}
    func fetchItem()
}


protocol DetailInteractorContract {
    func fetch(_ completion: @escaping (Result<DetailViewModel, Error>) -> ())
}


