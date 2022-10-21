//
//  PasswordStrengthView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct PasswordStrengthView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PasswordStrengthViewModel()
    var isIPad: Bool {
        if UIDevice.current.localizedModel == "iPad" {
             return true
        } else {
             return false
        }
    }
    
    var body: some View {
        ScrollView {
            
            if !isIPad { DismissButton { dismiss() } }
            
            PasswordTextField(title: i18n.verifyStrength.translation, generatedPassword: $viewModel.password)
                .onChange(of: viewModel.password) { _ in
                    withAnimation {
                        viewModel.checkPassword()
                    }
                }
                .padding(.horizontal, isIPad ? 50 : 0)
            
            PWText(text: viewModel.passwordStrength.title)
                .transition(.opacity)
            
            Button {
                viewModel.checkPassword()
            } label: {
                PWText(text: i18n.verify.translation)
            }

            
            StrengthCard(strength: .weak)
                .padding(.horizontal, isIPad ? 50 : 0)
            StrengthCard(strength: .mediocre)
                .padding(.horizontal, isIPad ? 50 : 0)
            StrengthCard(strength: .strong)
                .padding(.horizontal, isIPad ? 50 : 0)
            StrengthCard(strength: .veryStrong)
                .padding(.horizontal, isIPad ? 50 : 0)
            
            Spacer()
        }
    }
}

struct PasswordStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordStrengthView()
    }
}
