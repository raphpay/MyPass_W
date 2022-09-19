//
//  GeneratorViewViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import UIKit
import SwiftUI

final class GeneratorViewViewModel: ObservableObject {
    @Published var generatedPassword: String = ""
    @Published var charactersValue: Double = 24
    @Published var charactersRange: ClosedRange<Double> = 1...40
    @Published var separatorValue: Double = 6
    @Published var separatorRange: ClosedRange<Double> = 1...10
    @Published var showAlert: Bool = false
    @Published var alertTitle: LocalizedStringKey = ""
    @Published var backgroundColor: Color = .ui.strong
    @Published var passwordStrength: PasswordStrength = .weak
    
    func decreaseValue(_ valueType: ValueType) {
        switch valueType {
        case .characters:
            if (charactersValue > 1) {
                charactersValue -= 1
            }
        case .separators:
            if (separatorValue > 1) {
                separatorValue -= 1
            }
        }
    }
    
    func increaseValue(_ valueType: ValueType) {
        switch valueType {
        case .characters:
            if (charactersValue < 40) {
                charactersValue += 1
            }
        case .separators:
            if (separatorValue < 10) {
                separatorValue += 1
            }
        }
    }
    
    func generatePassword() {
        var password = ""
        for character in 1...(Int(charactersValue) + 1) {
            if character.isMultiple(of: Int(separatorValue + 1)) {
                password += "_"
            } else {
                password += password.random(length: 1)
            }
        }
        generatedPassword = password
    }
    
    func copyPassword() {
        if generatedPassword != "" {
            UIPasteboard.general.string = generatedPassword
            // Show a success alert
            showAlert.toggle()
            alertTitle = i18n.copied.translation
            generatedPassword = ""
        } else {
            showAlert.toggle()
            alertTitle = i18n.notCopied.translation
        }
    }
    
    
    func calculateColor() -> Color {
        var color = backgroundColor
        
        switch (charactersValue) {
        case PasswordStrength.weak.range:
            color = PasswordStrength.weak.color
            break
        case PasswordStrength.mediocre.range:
            color = PasswordStrength.mediocre.color
            break
        case PasswordStrength.strong.range:
            color = PasswordStrength.strong.color
            break
        case PasswordStrength.veryStrong.range:
            color = PasswordStrength.veryStrong.color
            break
        default:
            color = Color.ui.weak
            break
        }
        
        return color
    }
    
    func calculateTitle() -> LocalizedStringKey {
        var title: LocalizedStringKey
        
        switch (charactersValue) {
        case PasswordStrength.weak.range:
            title = PasswordStrength.weak.title
            break
        case PasswordStrength.mediocre.range:
            title = PasswordStrength.mediocre.title
            break
        case PasswordStrength.strong.range:
            title = PasswordStrength.strong.title
            break
        case PasswordStrength.veryStrong.range:
            title = PasswordStrength.veryStrong.title
            break
        default:
            title = PasswordStrength.weak.title
            break
        }
        
        return title
    }
}
