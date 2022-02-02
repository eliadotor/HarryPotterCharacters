//
//  CharactersProvider.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import Alamofire


enum CharacterProviderError: Error {
    case generic(Error?)
}

class NetworkCharactersProvider: CharacterProviderContract {
    private let session: Session
    private let house: String
    private let bundle: Bundle
    
    init(session: Session = .default, bundle: Bundle = .main, house: String = "") {
        self.session = session
        self.bundle = bundle
        self.house = house
    }
    
    func getCharacters(_ completion: @escaping (Result<[Character], CharacterProviderError>) -> ()) {
        let url = bundle.baseAPIUrl.appendingPathComponent("api/characters/\(house)")
        
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
