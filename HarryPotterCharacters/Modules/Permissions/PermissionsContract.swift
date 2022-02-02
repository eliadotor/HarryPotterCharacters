//
//  PermissionsContract.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 2/2/22.
//

import Foundation
import UIKit


protocol PermissionsPresenterContract: AnyObject {
    var view: UserFormContract? {set get}
    func didPressPermissionsSwitch()
}


protocol PermissionsInteractorContract: AnyObject {
    var output: PermissionsInteractorOutputContract? {set get}
    var currentPermission: PermissionsIteractorStatus {get}
    
    func requestPermissions()
}

protocol PermissionsInteractorOutputContract: AnyObject {
    func didUpdatePermission(status: PermissionsIteractorStatus)
}
