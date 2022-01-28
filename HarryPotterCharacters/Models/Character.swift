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

struct Character : Codable {
    let name: String
    let alternate_names: [String]
    let species: String
    let house: String
    let dateOfBirth: String
    let wizard: Bool
    let ancestry: String
    let wand: Wand
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
}
