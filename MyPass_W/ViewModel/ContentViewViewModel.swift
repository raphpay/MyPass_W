//
//  ContentViewViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import UIKit

final class ContentViewViewModel: ObservableObject {
    @Published var generatedPassword: String = ""
    @Published var charactersValue: Double = 24
    @Published var charactersRange: ClosedRange<Double> = 1...40
    @Published var separatorValue: Double = 6
    @Published var separatorRange: ClosedRange<Double> = 1...10
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    
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
}
