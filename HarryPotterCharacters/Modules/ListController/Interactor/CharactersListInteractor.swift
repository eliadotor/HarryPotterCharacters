//
//  CharactersInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation


class CharactersListInteractor: ListInteractorContract {
    var charactersProvider: CharacterProviderContract?
    
    weak var output: ListInteractorOutputContract?
    
//    func fetchItems(_ completion: @escaping (Result<[Character], CharacterProviderError>) ->()) {
//        charactersProvider?.getCharacters({ result in
//            switch result {
//            case .success(let characters): completion(.success(characters))
//            case .failure(let error):
//                completion(.failure(.generic(error)))
//            }
//
//        })
//    }
    func fetchItems() {
        charactersProvider?.getCharacters({result in
            switch result {
            case .success(let characters): self.output?.didFetch(characters: characters)
            case .failure: self.output?.fetchDidFail()
            }
            
        })
    }
}
