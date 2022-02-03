//
//  HousesViewContract.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation
import UIKit

protocol HouseCollectionviewContract: UIViewController {
    var presenter: HousesCollectionPresenterContract? {set get}
    func reloadData()
}

protocol HousesCollectionPresenterContract: AnyObject {
    var view: HousesCollectionViewController? {set get}
    var numItems: Int {get}
    func viewDidLoad()
    func fetchSelectItem(at indexPath: IndexPath) -> String
    func didSelectItem(at indexPath: IndexPath)
}

protocol HousesCollectionInteractorContract: AnyObject {
    var output: HousesCollectionInteractorOutputContract? {get set}
    func fetchHouses()
}

protocol HousesCollectionInteractorOutputContract: AnyObject {
    func fetchHouses(houses: [String])
    func fetchDidFail()
}


protocol HousesCollectionWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to house: String)
}
