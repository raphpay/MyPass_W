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
    
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        VStack {
            AppLogo()
            
            PasswordTextField(generatedPassword: $viewModel.generatedPassword)
            
            RangeSlider(value: $viewModel.charactersValue, range: viewModel.charactersRange) {
                viewModel.decreaseValue(.characters)
            } onIncrease: {
                viewModel.increaseValue(.characters)
            }
            
            Spacer()
                .frame(height: 100)
            
            RangeSlider(value: $viewModel.separatorValue, range: viewModel.separatorRange) {
                viewModel.decreaseValue(.separators)
            } onIncrease: {
                viewModel.increaseValue(.separators)
            }

            Spacer()
                .frame(height: 100)
            
            RoundedButton(title: "Generate") {
                viewModel.generatePassword()
            }
            
            RoundedButton(title: "Copy") {
                viewModel.copyPassword()
            }
            
            Spacer()
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
