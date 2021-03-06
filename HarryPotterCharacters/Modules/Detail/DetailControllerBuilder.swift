//
//  DetailControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 29/1/22.
//

import Foundation
import UIKit


class DetailControllerBuilder {
    
    func build(viewModel: DetailViewModel) -> UIViewController {
        let viewController = DetailViewController.createFromStoryBoard()
        let interactor = DetailInteractor(viewModel: viewModel)
        viewController.presenter = DetailPresenter(interactor: interactor)
        return viewController
    }
    
}
