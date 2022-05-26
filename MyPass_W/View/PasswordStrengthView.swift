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
        
    var body: some View {
        VStack {
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
            
            Button {
                // Verify
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
}

struct PasswordStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordStrengthView()
    }
}
