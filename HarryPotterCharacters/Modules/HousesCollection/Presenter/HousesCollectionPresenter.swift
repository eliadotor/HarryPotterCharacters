//
//  HousesCollectionPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation


class HousesCollectionPresenter: HousesCollectionPresenterContract {
    weak var view: HousesCollectionViewController?
    private let interactor: HousesCollectionInteractorContract?
    private let wireframe: HousesCollectionWireframeContract?
    
    init(interactor: HousesCollectionInteractorContract?, wireframe: HousesCollectionWireframeContract?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private var houses = [String]()
    
    var numItems: Int {
        return houses.count
    }
    
    func viewDidLoad() {
        interactor?.output = self
        fetchData()
    }
    
    func fetchSelectItem(at indexPath: IndexPath) -> String {
        let item = houses[indexPath.row]
        return item
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let house = houses[indexPath.row]
        wireframe?.navigate(to: house)
    }
    
    private func fetchData(){
        interactor?.fetchHouses()
    }

}


extension HousesCollectionPresenter: HousesCollectionInteractorOutputContract {
    
    func fetchHouses(houses: [String]) {
        self.houses = houses
    }
    
    func fetchDidFail() {
        print("Error")
    }

}
