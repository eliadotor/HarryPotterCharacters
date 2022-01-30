//
//  HouseCollectionWireframe.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit


class HousesCollectionWireframe: HousesCollectionWireframeContract {
    weak var view: UIViewController?
    
    func navigate(to house: String) {
        DispatchQueue.main.async {
            let viewController = ListControllerBuilder().build()
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
}
