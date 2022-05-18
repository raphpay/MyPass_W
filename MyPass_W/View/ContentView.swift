//
//  ContentView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 17/05/2022.
//

import SwiftUI

enum ValueType {
    case characters, separators
}

struct ContentView: View {
    // TODO: Create a ViewModel
    @State private var generatedPassword: String = ""
    @State private var charactersValue: Double = 3
    @State private var charactersRange: ClosedRange<Double> = 1...40
    @State private var separatorValue: Double = 6
    @State private var separatorRange: ClosedRange<Double> = 1...10
    
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
    
    // TODO: Create components
    var body: some View {
        VStack {
            AppLogo()
            
            PasswordTextField(generatedPassword: $generatedPassword)
            
            RangeSlider(value: $charactersValue, range: charactersRange) {
                decreaseValue(.characters)
            } onIncrease: {
                increaseValue(.characters)
            }
            
            Spacer()
                .frame(height: 100)
            
            RangeSlider(value: $separatorValue, range: separatorRange) {
                decreaseValue(.separators)
            } onIncrease: {
                increaseValue(.separators)
            }

            Spacer()
                .frame(height: 100)
            
            RoundedButton(title: "Generate") {
                generatePassword()
            }
            
            RoundedButton(title: "Copy") {
                copyPassword()
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
