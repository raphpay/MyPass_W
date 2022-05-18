//
//  ContentViewViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import UIKit
import SwiftUI

final class ContentViewViewModel: ObservableObject {
    @Published var generatedPassword: String = ""
    @Published var charactersValue: Double = 24
    @Published var charactersRange: ClosedRange<Double> = 1...40
    @Published var separatorValue: Double = 6
    @Published var separatorRange: ClosedRange<Double> = 1...10
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var backgroundColor: Color = .ui.strong
    @Published var passwordStrength: PasswordStrenght = .weak
    
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
            alertTitle = "Password copied in clipboard"
        } else {
            showAlert.toggle()
            alertTitle = "No password to copy !"
        }
    }
    
    
    func calculateColor() -> Color {
        var color = backgroundColor
        
        switch (charactersValue) {
        case PasswordStrenght.weak.range:
            color = PasswordStrenght.weak.color
            break
        case PasswordStrenght.mediocre.range:
            color = PasswordStrenght.mediocre.color
            break
        case PasswordStrenght.strong.range:
            color = PasswordStrenght.strong.color
            break
        case PasswordStrenght.veryStrong.range:
            color = PasswordStrenght.veryStrong.color
            break
        default:
            color = Color.ui.weak
            break
        }
        
        return color
    }
    
    func calculateTitle() -> String {
        var title: String
        
        switch (charactersValue) {
        case PasswordStrenght.weak.range:
            title = PasswordStrenght.weak.title
            break
        case PasswordStrenght.mediocre.range:
            title = PasswordStrenght.mediocre.title
            break
        case PasswordStrenght.strong.range:
            title = PasswordStrenght.strong.title
            break
        case PasswordStrenght.veryStrong.range:
            title = PasswordStrenght.veryStrong.title
            break
        default:
            title = PasswordStrenght.weak.title
            break
        }
        
        return title
    }
}
