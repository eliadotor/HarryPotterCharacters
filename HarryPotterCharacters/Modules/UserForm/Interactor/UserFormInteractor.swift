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
            case .none:
                self.output?.fetchDidFail()
            case .some(let user):
                self.output?.didFetchUser(user)
            }
        })
    }
    
    
    func saveUser(_ user: UserFormModel) {
        userProvider?.saveUser(user)
    }
    
}
