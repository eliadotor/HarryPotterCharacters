//
//  UserFormProvider.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation

enum UserFormProviderError: Error {
    case badUrl, generic(Error?)
}
protocol UserFormProviderContract {
    func saveUser(_ user: UserFormModel)
    func loadUser(_ completion: @escaping (UserFormModel?) -> ())
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
    
    func saveUser(_ user: UserFormModel) {
        guard let url = fileUrl else {
            return
        }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(user)
            try data.write(to: url)
        } catch {
            print("Error save")
        }
    }
    
    func loadUser(_ completion: @escaping (UserFormModel?) -> ()) {
        DispatchQueue.global().async {
            guard let url = self.fileUrl else {
                completion(nil)
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            
            do {
                let user = try PropertyListDecoder().decode(UserFormModel.self, from: data)
                completion(user)
            } catch {
                print("Error load")

            }
        }
    }
}

