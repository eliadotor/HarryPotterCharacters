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
    func build(house: String)-> UIViewController {
        let viewController = ListViewController.createFromStoryBoard()
        let viewControllerHouse = HousesCollectionViewController.createFromStoryBoard()
        viewController.navigationItem.title = "\(house) House"
        let presenter = CharactersListPresenter()
        let presenterHouse = HousesCollectionPresenter()
        let interactor = CharactersListInteractor()
        let interactorHouse = HousesCollectionInteractor()

        interactor.charactersProvider = NetworkCharactersProvider(session: .default, house: "house/\(house.lowercased())")
        
        let wireframe = CharactersListWireframe()
        let wireframeHouse = HousesCollectionWireframe()
        viewController.presenter = presenter
        viewControllerHouse.presenter = presenterHouse
        presenterHouse.interactor = interactorHouse
        presenterHouse.view = viewControllerHouse
        presenterHouse.wireframe = wireframeHouse
        presenter.viewList = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        return viewController
    }
        
}
