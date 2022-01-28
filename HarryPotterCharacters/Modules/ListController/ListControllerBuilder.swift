//
//  ListControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import UIKit

class ListControllerBuilder {
    
    func build()-> UIViewController {
        let viewController = ListViewController.createFromStoryBoard()
        viewController.navigationItem.title = "Characters List"
        let presenter = CharactersListPresenter()
        let interactor = CharactersListInteractor()
        interactor.charactersProvider = NetworkCharactersProvider()
        
//        let wireframe = CatsListWireframe()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        //presenter.wireframe = wireframe
        //wireframe.view = viewController
        return viewController
    }
        
}
