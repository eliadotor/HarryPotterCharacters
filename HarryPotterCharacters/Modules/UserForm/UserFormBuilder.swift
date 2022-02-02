//
//  UserFormBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation
import UIKit


class UserFormBuilder {
    func build() -> UIViewController {
        let viewController = UserFormViewController.createFromStoryBoard()
        let presenter = UserFormPresenter()
        presenter.view = viewController
        let interactorPermissions = PermissionsInteractor()
        let peresenterPermissions = PermissionsPresenter(interactor: interactorPermissions)
        viewController.presenter = presenter
        viewController.permissionsPresenter = peresenterPermissions
        
        let interactor = UserFormInteractor()
        interactor.userProvider = UserDefaultsProvider()
        
        presenter.interactor = interactor
        return viewController
    }
}
