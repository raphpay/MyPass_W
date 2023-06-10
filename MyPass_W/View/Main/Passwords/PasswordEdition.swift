//
//  PasswordEdition.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI
import RealmSwift

struct PasswordEdition: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject private var viewModel = PasswordEditionViewModel()
    
    var body: some View {
        VStack {
            PWTextField(placeholder: "Website", value: $viewModel.website)
            PWTextField(placeholder: "Username", value: $viewModel.username)
            PWSecureTextField(placeholder: "Password", value: $viewModel.password)
            
            RoundedButton(title: "Save password") {
                // Save password into Realm
                viewModel.saveCredentials()
                // Go back
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct PasswordEdition_Previews: PreviewProvider {
    static var previews: some View {
        PasswordEdition()
    }
}

