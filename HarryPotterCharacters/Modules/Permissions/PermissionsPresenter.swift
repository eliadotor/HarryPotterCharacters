//
//  PermissionsPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 2/2/22.
//

import Foundation


enum PermissionsIteractorStatus {
    case allowed, denied, unknown
}

class PermissionsPresenter {
    
    private let interactor: PermissionsInteractorContract?
    
    init(interactor: PermissionsInteractorContract?) {
        self.interactor = interactor
    }
    
    weak var view: UserFormContract? {
        didSet {
            guard let status = interactor?.currentPermission else {return}
            interactor?.output = self
            didUpdatePermission(status: status)
        }
    }
    
}

extension PermissionsPresenter: PermissionsPresenterContract {
    func didPressPermissionsSwitch() {
        guard let status = interactor?.currentPermission else {return}
        switch status {
        case .allowed:
            break
        case .denied:
            view?.openSettings()
        case .unknown:
            interactor?.requestPermissions()
        }
    }
}

extension PermissionsPresenter: PermissionsInteractorOutputContract {
    func didUpdatePermission(status: PermissionsIteractorStatus) {
        switch status {
        case .allowed:
            view?.setAllowed()
        case .denied, .unknown:
            view?.setNotAllowed()
        }
    }
}
