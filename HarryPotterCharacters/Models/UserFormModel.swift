//
//  UserFormModel.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation


struct UserFormModel: Codable, Equatable {
    var name:String?
    var phone:String?
    var mail: String?
    var data: String?
}


extension UserFormModel {
    var isValidName: Bool {
        return validate(field: name)
    }
    
    var isValidPhone: Bool {
        return validate(field: phone)
    }
    
    var isValidMail: Bool {
        return validate(field: mail)
    }
    
    var isValid: Bool {
        return isValidName && isValidPhone && isValidMail
    }
    
    var toFormViewModel: UserFormViewModel {
        return UserFormViewModel(name: name, phone: phone, mail: mail, data: data)
    }
}


private extension UserFormModel {
    func validate(field: String?) -> Bool {
        guard let field = field else {
            return false
        }
        switch field{
            case mail: return !field.isEmpty && field.isValidEmail
            case phone: return !field.isEmpty && field.isValidPhone
            default: break
        }
        return !field.isEmpty
    }
}
