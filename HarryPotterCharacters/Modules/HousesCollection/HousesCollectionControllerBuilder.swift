//
//  HousesCollectionControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit

class HousesCollectionControllerBuilder {
    private let title = "houses_collection_title".localized
    func build()-> UIViewController {
        let viewController = HousesCollectionViewController.createFromStoryBoard()
        viewController.navigationItem.title = title
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
