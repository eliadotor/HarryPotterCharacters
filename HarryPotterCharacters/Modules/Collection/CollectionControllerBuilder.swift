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
        let wireframe = CharactersListWireframe()
        interactor.charactersProvider = NetworkCharactersProvider(session: .default, house: "")
        viewController.presenter = presenter
        presenter.viewCollection = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        return viewController
    }
    
    func builderForTabBar(tag: Int) -> UIViewController {
        let viewController = build()
        viewController.tabBarItem = .init(title: "Collection", image: UIImage.init(systemName: "rectangle.stack.person.crop.fill"), tag: tag)
        return viewController
    }
    
}
