//
//  GeneratorView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 17/05/2022.
//

import SwiftUI

enum ValueType {
    case characters, separators
}

struct GeneratorView: View {
    
    @StateObject var viewModel = GeneratorViewViewModel()
    
    var body: some View {
        VStack {
            AppLogo()
            
            PasswordTextField(generatedPassword: $viewModel.generatedPassword)
            
            VStack {
                PWText(text: viewModel.calculateTitle(), fontSize: 30)
                    .foregroundColor(.white)
                
                RangeSlider(type: .characters, value: $viewModel.charactersValue, range: viewModel.charactersRange) {
                    viewModel.decreaseValue(.characters)
                } onIncrease: {
                    viewModel.increaseValue(.characters)
                }
                
                RangeSlider(type: .separators, value: $viewModel.separatorValue, range: viewModel.separatorRange) {
                    viewModel.decreaseValue(.separators)
                } onIncrease: {
                    viewModel.increaseValue(.separators)
                }
            }.padding(.top, 16)

            Spacer()
            
            RoundedButton(title: i18n.generate.translation) {
                viewModel.generatePassword()
            }
            
            RoundedButton(title: i18n.copy.translation) {
                viewModel.copyPassword()
            }
            
            Spacer()
        }
        .background(viewModel.calculateColor())
        .alert(LocalizedStringKey(viewModel.alertTitle), isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeneratorView()
                .environment(\.locale, .init(identifier: "en_EN"))
            GeneratorView()
                .environment(\.locale, .init(identifier: "fr_FR"))
        }
    }
}
