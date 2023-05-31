//
//  MPWTextField.swift
//  MyPass_W
//
//  Created by Personal on 31/05/2023.
//

import SwiftUI

struct MPWTextField: View {
    
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .autocapitalization(.none)
            .disableAutocorrection(true)
    }
}

struct MPWTextField_Previews: PreviewProvider {
    static var previews: some View {
        MPWTextField(placeholder: "Email", value: .constant(""))
    }
}
