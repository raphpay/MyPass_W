//
//  PasswordStrengthViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//
//  All rights reserved
//

import Foundation

final class PasswordStrengthViewModel: ObservableObject {
  // MARK: - Properties
    @Published var password: String = ""
    @Published var passwordStrength: PasswordStrength = .none
}

// MARK: - Functions
extension PasswordStrengthViewModel {
    func checkPassword() {
        let passwordLength = password.count
        var containsSymbols = false
        var containsUppercase = false
        
        for character in password {
            if character.isUppercase {
                containsUppercase = true
            }
            
            if character.isSymbol() {
                containsSymbols = true
            }
        }
        
        if containsSymbols && containsUppercase {
            if PasswordStrength.weak.range.contains(Double(passwordLength)) {
                passwordStrength = .weak
            } else if PasswordStrength.mediocre.range.contains(Double(passwordLength)) {
                passwordStrength = .mediocre
            } else if PasswordStrength.strong.range.contains(Double(passwordLength)) {
                passwordStrength = .strong
            } else if PasswordStrength.veryStrong.range.contains(Double(passwordLength)) {
                passwordStrength = .veryStrong
            }
        } else {
            passwordStrength = .weak
        }
    }
}
