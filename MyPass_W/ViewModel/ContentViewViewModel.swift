//
//  ContentViewViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var generatedPassword: String = ""
    @Published var charactersValue: Double = 3
    @Published var charactersRange: ClosedRange<Double> = 1...40
    @Published var separatorValue: Double = 6
    @Published var separatorRange: ClosedRange<Double> = 1...10
    
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
        print("generatePassword")
    }
    
    func copyPassword() {
        print("copyPassword")
    }
}
