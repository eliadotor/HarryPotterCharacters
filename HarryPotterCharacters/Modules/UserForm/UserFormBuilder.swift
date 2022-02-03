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
        let interactorPermissions = PermissionsInteractor()
        let peresenterPermissions = PermissionsPresenter(interactor: interactorPermissions)
        viewController.presenter = buildPresenter()
        viewController.permissionsPresenter = peresenterPermissions
        return viewController
    }
    
    func builderForTabBar(tag: Int) -> UIViewController {
        let viewController = build()
        viewController.tabBarItem = .init(title: "Form", image: UIImage.init(systemName: "pencil.and.outline"), tag: tag)
        return viewController
    }
}

private extension UserFormBuilder {

    func buildProvider() -> UserFormProviderContract {
        UserDefaultsProvider()
    }

    func buildInteractor() -> UserFormInteractorContract {
        UserFormInteractor(provider: buildProvider())
    }
    
    func buildPresenter() -> UserFormPresenterContract {
        UserFormPresenter(interactor: buildInteractor())
    }
}
