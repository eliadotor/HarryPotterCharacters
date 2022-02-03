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
        viewController.permissionsPresenter = buildPresenter()
        return viewController
    }
}


private extension PermissionsBuilder {
    func buildInteractor() -> PermissionsInteractorContract {
        PermissionsInteractor()
    }
    func buildPresenter() -> PermissionsPresenterContract {
        PermissionsPresenter(interactor: buildInteractor())
    }
}
