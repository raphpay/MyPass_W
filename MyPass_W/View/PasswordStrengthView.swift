//
//  PasswordStrengthView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct PasswordStrengthView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var password: String = ""
    @State private var passwordStrength: PasswordStrength = .none
        
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                }
                .tint(.black)
                .padding(.trailing, 16)
            }
            .padding(.top, 20)
            
            PasswordTextField(title: "Verify your password", generatedPassword: $password)
                .onChange(of: password) { _ in
                    withAnimation {
                        checkPassword()
                    }
                }
            
            PWText(text: passwordStrength.title)
                .transition(.opacity)
            
            Button {
                checkPassword()
            } label: {
                Text("Verify")
            }

            
            StrengthCard(strength: .weak)
            StrengthCard(strength: .mediocre)
            StrengthCard(strength: .strong)
            StrengthCard(strength: .veryStrong)
            
            Spacer()
        }
    }
    
    func checkPassword() {
        let passwordLength = password.count
        var containsSymbols = false
        var containsUppercase = false
        
        for character in password {
            if character.isUppercase {
                containsUppercase = true
            }
            
            if character.isSymbol() {
                containsSymbols = true
            }
        }
        
        if containsSymbols && containsUppercase {
            if PasswordStrength.weak.range.contains(Double(passwordLength)) {
                passwordStrength = .weak
            } else if PasswordStrength.mediocre.range.contains(Double(passwordLength)) {
                passwordStrength = .mediocre
            } else if PasswordStrength.strong.range.contains(Double(passwordLength)) {
                passwordStrength = .strong
            } else if PasswordStrength.veryStrong.range.contains(Double(passwordLength)) {
                passwordStrength = .veryStrong
            }
        } else {
            passwordStrength = .weak
        }
    }
}

struct PasswordStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordStrengthView()
    }
}
