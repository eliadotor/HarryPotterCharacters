//
//  UserFormViewContract.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation
import UIKit

protocol UserFormContract: UIViewController {
    var presenter: UserFormPresenterContract? {get set}
    var permissionsPresenter: PermissionsPresenterContract? {set get}
    
    
    func configure(with viewModel: UserFormViewModel)
    
    func didValidateName(_ valid: Bool)
    func didValidatePhone(_ valid: Bool)
    func didValidateMail(_ valid: Bool)
    func showValidationError()
    
    func setAllowed()
    func setNotAllowed()
    func openSettings()
}

protocol UserFormPresenterContract {
    var view: UserFormContract? {get set}
    var interactor: UserFormInteractorContract? {get set}
    func didLoad()
    
    func didUpdateName(_ name: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)
    func didUpdateData(_ data: String?)
    func didPressSend()
}


protocol UserFormInteractorContract {
    var userProvider: UserFormProviderContract? {get set}
    var output: UserFormInteractorOutputContract? {get set}
    func saveUser(_ user: UserFormModel)
    func fetchUser()
}

protocol UserFormInteractorOutputContract: AnyObject {
    func didFetchUser(_ user: UserFormModel)
    func fetchDidFail()

}
