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
        
        
        let presenter = HousesCollectionPresenter()
        let interactor = HousesCollectionInteractor()
        let wireframe = HousesCollectionWireframe()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        return viewController        
    }
        
}
