//
//  HousesInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation


class HousesCollectionInteractor: HousesCollectionInteractorContract {
    
    weak var output: HousesCollectionInteractorOutputContract?
    
    var houses = ["Gryffindor",  "Hufflepuff",  "Ravenclaw",  "Slytherin"]
    
    func fetchHouses() {
        self.output?.fetchHouses(houses: houses)
    }
    
}
