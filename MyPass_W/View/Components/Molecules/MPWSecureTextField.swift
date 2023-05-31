//
//  MPWSecureTextField.swift
//  MyPass_W
//
//  Created by Personal on 31/05/2023.
//

import SwiftUI

struct MPWSecureTextField: View {
    
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        SecureField(placeholder, text: $value)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .disableAutocorrection(true)
    }
}

struct MPWSecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        MPWSecureTextField(placeholder: "Password", value: .constant(""))
    }
}
