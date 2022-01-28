//
//  UIViewControllerExtensions.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import UIKit

extension UIViewController {
    static func createFromStoryBoard() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: .main).instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
