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
        
    var body: some View {
        ScrollView {
            
            DismissButton { dismiss() }
            
            // TODO: i18n
            PasswordTextField(title: "Verify your password", generatedPassword: $viewModel.password)
                .onChange(of: viewModel.password) { _ in
                    withAnimation {
                        viewModel.checkPassword()
                    }
                }
            
            PWText(text: viewModel.passwordStrength.title)
                .transition(.opacity)
            
            Button {
                viewModel.checkPassword()
            } label: {
                // TODO: i18n
                Text("Verify")
            }

            
            StrengthCard(strength: .weak)
            StrengthCard(strength: .mediocre)
            StrengthCard(strength: .strong)
            StrengthCard(strength: .veryStrong)
            
            Spacer()
        }
    }
}

struct PasswordStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordStrengthView()
    }
}
