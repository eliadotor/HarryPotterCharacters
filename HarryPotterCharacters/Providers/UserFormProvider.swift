//
//  UserFormProvider.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation

enum UserFormProviderError: Error {
    case loadError, saveError, generic(Error?)
}

protocol UserFormProviderContract {
    func saveUser(_ user: UserFormModel, _ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ())
    func loadUser(_ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ())
}


class UserDefaultsProvider: UserFormProviderContract {
    private let fileManager: FileManager
    private let filename: String

    init(fileManager: FileManager = FileManager.default, filename: String = "userData") {
        self.fileManager = fileManager
        self.filename = filename
    }
    
    private var fileUrl: URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(filename).plist")
        return url
    }
    
    func saveUser(_ user: UserFormModel, _ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ()) {
        guard let url = fileUrl else {
            return
        }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(user)
            try data.write(to: url)
            completion(.success(user))
        } catch {
            completion(.failure(.saveError))
        }
    }
    
    func loadUser(_ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ()) {
        DispatchQueue.global().async {
            guard let url = self.fileUrl else {
                completion(.success(nil))
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completion(.success(nil))
                return
            }
            do {
                let user = try PropertyListDecoder().decode(UserFormModel.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(.loadError))

            }
        }
    }
}

