//
//  StringExtensions.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}


extension String {
    var isValidEmail: Bool {
        guard !self.isEmpty else {
            return true
        }

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }

    var isValidPhone: Bool {
        guard !self.isEmpty else {
            return true
        }

        let phoneRegEx = "(^\\+\\d{2,5}\\d{5,12}$)|^\\d{9}$"

        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
}
