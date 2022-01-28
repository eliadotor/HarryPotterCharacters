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
        tabBarController.setViewControllers([buildList()], animated: false)
        return tabBarController
    }
}


private extension InitialControllerBuilder {
    func buildList() -> UINavigationController {
        let viewController = ListControllerBuilder().build()
        let tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        return buildNavigation(with: viewController, tabBarItem: tabBarItem)
    }


    func buildNavigation(with viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }

}
