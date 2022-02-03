//
//  CharactersInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation


class CharactersListInteractor: ListInteractorContract {
    
    let charactersProvider: CharacterProviderContract?
    init(provider: CharacterProviderContract) {
        self.charactersProvider = provider
    }
    
    weak var output: ListInteractorOutputContract?
    
    func fetchItems() {
        charactersProvider?.getCharacters({result in
            switch result {
            case .success(let characters): self.output?.didFetch(characters: characters)
            case .failure: self.output?.fetchDidFail()
            }
        })
    }
}
