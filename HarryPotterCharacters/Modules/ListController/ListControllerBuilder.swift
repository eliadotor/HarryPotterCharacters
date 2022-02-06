//
//  ListControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import UIKit
import Alamofire

class ListControllerBuilder {
    private let title = "list_navigation_title".localized
    func build(house: String)-> UIViewController {
        let viewController = ListViewController.createFromStoryBoard()
        viewController.navigationItem.title =  "\(house) \(title)"
        let wireframe = CharactersListWireframe()
        viewController.presenter = buildPresenter(house: house, wireframe: wireframe)
        wireframe.view = viewController
        return viewController
    }
}

private extension ListControllerBuilder {
    func buildProvider(house: String) -> CharacterProviderContract {
        NetworkCharactersProvider(session: .default, house: "house/\(house.lowercased())")
    }

    func buildInteractor(house: String) -> ListInteractorContract {
        CharactersListInteractor(provider: buildProvider(house: house))
    }

    func buildPresenter(house: String, wireframe: CharactersListWireframe) -> ListPresenterContract {
        CharactersListPresenter(interactor: buildInteractor(house: house), wireframe: wireframe)
    }

}
