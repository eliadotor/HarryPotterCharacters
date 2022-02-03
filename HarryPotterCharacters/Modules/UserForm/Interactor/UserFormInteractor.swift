//
//  UserFormInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation

class UserFormInteractor: UserFormInteractorContract {
    weak var output: UserFormInteractorOutputContract?
    var userProvider: UserFormProviderContract?
    
    func fetchUser() {
        userProvider?.loadUser({ result in
            switch result {
            case .success(let user):
                self.output?.didFetchUser(user!)
            case .failure:
                self.output?.fetchDidFail()
            
            }
        })
    }
    
    
    func saveUser(_ user: UserFormModel) {
        userProvider?.saveUser(user)
    }
    
}
