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
    var isIPad: Bool {
        if UIDevice.current.localizedModel == "iPad" {
             return true
        } else {
             return false
        }
    }
    
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
            .padding(.bottom, 20)
            
            RoundedButton(title: i18n.copy.translation) {
                viewModel.copyPassword()
            }
            
            Spacer()
        }
        .padding(.horizontal, isIPad ? 100 : 0)
        .background(viewModel.calculateColor())
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
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
                .previewInterfaceOrientation(.portrait)
            GeneratorView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        }
    }
}
