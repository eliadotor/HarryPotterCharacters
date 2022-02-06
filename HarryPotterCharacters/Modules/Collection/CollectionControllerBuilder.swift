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
        let wireframe = CharactersListWireframe()
        viewController.presenter = buildPresenter(wireframe: wireframe)
        wireframe.view = viewController
        return viewController
    }
 
    func builderForTabBar(tag: Int) -> UIViewController {
        let viewController = build()
        viewController.tabBarItem = .init(title: "tab_bar_tag_collection".localized, image: UIImage.init(systemName: "rectangle.stack.person.crop.fill"), tag: tag)
        return viewController
    }
    
}

private extension CollectionControllerBuilder {
    func buildProvider() -> CharacterProviderContract {
        NetworkCharactersProvider(session: .default, house: "")
    }
    
    func buildInteractor() -> ListInteractorContract {
        CharactersListInteractor(provider: buildProvider())
    }
    
    func buildInteractorHouses() -> HousesCollectionInteractorContract {
        HousesCollectionInteractor()
    }
    
    func buildPresenter(wireframe: CharactersListWireframe) -> ListPresenterContract {
        CharactersListPresenter(interactor: buildInteractor(), wireframe: wireframe)
    }

}
