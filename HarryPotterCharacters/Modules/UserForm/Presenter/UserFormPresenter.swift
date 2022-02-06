//
//  UserFormPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation

class UserFormPresenter: UserFormPresenterContract {
    weak var view: UserFormContract?

    private var interactor: UserFormInteractorContract?
    
    init(interactor: UserFormInteractorContract?) {
        self.interactor = interactor
    }
    
    func didLoad() {
        interactor?.output = self
        fetchUser()
    }
    
    private var userFormModel = UserFormModel()
    
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
        if userFormModel.isValid {
            view?.showValidation()
        } else {
            view?.showValidationError()
            return
        }
        interactor?.saveUser(userFormModel)
    }
    
    func fetchUser() {
        interactor?.fetchUser()
    }
    
}


extension UserFormPresenter: UserFormInteractorOutputContract {
    func didFetchUser(_ user: UserFormModel) {
        self.userFormModel = user
        view?.configure(with: user.toFormViewModel)
    }
    
    func fetchDidFail() {
        print("Error")
    }
    
}
