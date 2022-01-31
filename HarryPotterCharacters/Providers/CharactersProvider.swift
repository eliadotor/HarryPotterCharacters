//
//  CharactersProvider.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import Alamofire


enum CharacterProviderError: Error {
    case badUrl, generic(Error?)
}

class NetworkCharactersProvider: CharacterProviderContract {
    private let session: Session
    private let house: String
    
    init(session: Session = .default, house: String = "") {
        self.session = session
        self.house = house
    }
    
    func getCharacters(_ completion: @escaping (Result<[Character], CharacterProviderError>) -> ()) {
        guard let url = URL(string: "http://hp-api.herokuapp.com/api/characters/\(house)") else {
            completion(.failure(.badUrl))
            return
        }
        
        let request = URLRequest(url: url)
        session.request(request).responseDecodable { (response: DataResponse<[Character], AFError>) in
            switch response.result {
            case.success(let characters):
                completion(.success(characters))
            case.failure(let error): completion(.failure(.generic(error)))
            }
        }.validate()
    }
    
}
