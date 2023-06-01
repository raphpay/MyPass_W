//
//  PWTextField.swift
//  MyPass_W
//
//  Created by Personal on 31/05/2023.
//

import SwiftUI

struct PWTextField: View {
    
    let placeholder: String
    @Binding var value: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField(placeholder, text: $value)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .frame(height: 50)
            .keyboardType(keyboardType)
    }
}

struct PWTextField_Previews: PreviewProvider {
    static var previews: some View {
        PWTextField(placeholder: "Email", value: .constant(""))
    }
}
