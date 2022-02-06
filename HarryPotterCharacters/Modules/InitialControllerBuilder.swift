//
//  InitialControllerBuilder.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    
    
    func build() -> UIViewController {
        let tabBarController = UITabBarController()
        let viewControllers = [buildList(), CollectionControllerBuilder().builderForTabBar(tag: 1), UserFormBuilder().builderForTabBar(tag: 2)]
        tabBarController.setViewControllers(viewControllers, animated: false)
        return tabBarController
    }
}


private extension InitialControllerBuilder {
    func buildList() -> UINavigationController {
        let viewController = HousesCollectionControllerBuilder().build()
        let tabBarItem = UITabBarItem(title: "tab_bar_tag_list".localized, image: UIImage.init(systemName: "list.bullet"), tag: 0)
        return buildNavigation(with: viewController, tabBarItem: tabBarItem)
    }

    func buildNavigation(with viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
    
    func buildForm() -> UIViewController {
        let viewController = UserFormBuilder().build()
        viewController.tabBarItem = UITabBarItem.init(title: "tab_bar_tag_form".localized, image: UIImage(systemName: "pencil.and.outline"), tag: 2)
        return viewController
    }
    


}
