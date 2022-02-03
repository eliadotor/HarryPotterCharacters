//
//  HousesCollectionControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit

class HousesCollectionControllerBuilder {
    
    func build()-> UIViewController {
        let viewController = HousesCollectionViewController.createFromStoryBoard()
        viewController.navigationItem.title = "Hogwarts houses"
        let wireframe = HousesCollectionWireframe()
        viewController.presenter = buildPresenter(wireframe: wireframe)
        wireframe.view = viewController
        return viewController        
    }
        
}

private extension HousesCollectionControllerBuilder {
    
    func buildInteractor() -> HousesCollectionInteractorContract {
        HousesCollectionInteractor()
    }

    func buildPresenter(wireframe: HousesCollectionWireframe) -> HousesCollectionPresenterContract {
        HousesCollectionPresenter(interactor: buildInteractor(), wireframe: wireframe)
    }

}
