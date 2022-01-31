//
//  CollectionControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit

class CollectionControllerBuilder {
    
    func build()-> UIViewController {
        let viewController = CollectionViewController.createFromStoryBoard()
        viewController.navigationItem.title = "Characters"
        let presenter = CharactersListPresenter()
        let interactor = CharactersListInteractor()
        interactor.charactersProvider = NetworkCharactersProvider(session: .default, house: "")
        
        let wireframe = CharactersListWireframe()
        viewController.presenter = presenter
        presenter.viewCollection = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        return viewController
    }
        
}
