//
//  UserFormPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation

class UserFormPresenter: UserFormPresenterContract {
    weak var view: UserFormContract?
    var interactor: UserFormInteractorContract?
    
    func didLoad() {
        interactor?.output = self
        print(userFormModel)
        print("user")
        fetchUser()
        
    }
    private var userFormModel = UserFormModel() {
        didSet {
            print(userFormModel)
        }
    }
    
    func didUpdateName(_ name: String?) {
        userFormModel.name = name
        view?.didValidateName(userFormModel.isValidName)
    }
    
    func didUpdatePhone(_ phone: String?) {
        userFormModel.phone = phone
        view?.didValidatePhone(userFormModel.isValidPhone)
    }
    
    func didUpdateMail(_ mail: String?) {
        userFormModel.mail = mail
        view?.didValidateMail(userFormModel.isValidMail)
    }
    
    func didUpdateData(_ data: String?) {
        userFormModel.data = data
    }
    
    func didPressSend() {
        guard userFormModel.isValid else {
            view?.showValidationError()
            print("retry")

            return
        }
        print("success")
        interactor?.saveUser(userFormModel)
    }
    
    func fetchUser() {
        print(userFormModel)
        interactor?.fetchUser()
    }
    
    deinit {
        print("deinit \(self)")
    }
}


extension UserFormPresenter: UserFormInteractorOutputContract {
    func didFetchUser(_ user: UserFormModel) {
        print(user)
        self.userFormModel = user
        view?.configure(with: user.toFormViewModel)
    }
    
    func fetchDidFail() {
        print("Error")
    }
    
}
