//
//  Character.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation

struct Wand: Codable {
    let wood: String
    let core: String
}

struct Character : Codable, Equatable {

    let name: String
    let alternate_names: [String]
    let species: String
    let house: String
    let dateOfBirth: String
    let wizard: Bool
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let image: String
}

extension Character {
    var imageUrl: URL? {
        return URL(string: image)
    }
        
    var houseCharacter: String {
        if house == "" {
           return "Hogwarts"
        } else {
            return house
        }
    }
    
    var toListCellViewModel: ListTableCellViewModel {
        return ListTableCellViewModel(imageUrl: imageUrl, name: name, house: houseCharacter)
    }
    
    var toDetailViewModel: DetailViewModel {
        return DetailViewModel(imageUrl: imageUrl, name: name, house: houseCharacter, dateOfBirth: dateOfBirth, patronus: patronus, actor: actor)
    }
    
    var toCollectionCellViewModel: CollectionCellViewModel {
        return CollectionCellViewModel(imageUrl: imageUrl, name: name, house: houseCharacter)
    }
}
