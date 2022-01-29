//
//  CharactersListWireframe.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 29/1/22.
//

import Foundation
import UIKit


class CharactersListWireframe: CharactersListWireframeContract {
    var view: UIViewController?
    
    func navigate(to character: Character) {
        DispatchQueue.main.async {
            let viewController = DetailControllerBuilder().build(viewModel: character.toDetailViewModel)
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
}
