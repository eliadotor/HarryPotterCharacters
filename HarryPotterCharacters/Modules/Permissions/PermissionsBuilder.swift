//
//  PermissionsBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 2/2/22.
//

import Foundation
import UIKit

class PermissionsBuilder {
    func build() -> UIViewController {
        let viewController = UserFormViewController.createFromStoryBoard()
        let interactor = PermissionsInteractor()
        let presenter = PermissionsPresenter(interactor: interactor)
        viewController.permissionsPresenter = presenter
        return viewController
    }
    
}
