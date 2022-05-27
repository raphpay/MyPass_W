//
//  PasswordTextField.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct PasswordTextField: View {
    
    var title: LocalizedStringKey = i18n.textfield.translation
    @Binding var generatedPassword: String
    
    var body: some View {
        TextField(title, text: $generatedPassword)
            .frame(height: 50)
            .font(.custom(Fonts.secularOne.rawValue, size: 20))
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 16)
            .disableAutocorrection(true)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextField(generatedPassword: .constant("MyPass_W0rd"))
    }
}
