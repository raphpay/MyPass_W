//
//  RegistrationView.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI

struct RegistrationView: View {
    // TODO: Pass info through navigation to enter the email and password
    @State private var email: String = ""
    @State private var password: String = ""
    // TODO: Add password confirmation logic
//    @State private var passwordConfirmation: String = ""
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            
            PWLoginBackground()
            
            VStack {
                Spacer()
                
                PWText(text: "My Pass_W", fontSize: 25)
                PWText(text: "Create your account", fontSize: 16, color: .secondary)
                
                PWTextField(placeholder: "Email", value: $email, keyboardType: .emailAddress)
                PWSecureTextField(placeholder: "Password", value: $password)
                
                Spacer()
                    .frame(height: 50)
                
                RoundedButton(title: "Create account", color: .black) {
                    authViewModel.createUser(email: email, password: password) { success in
                        print("Registration complete with:", success)
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(authViewModel: AuthViewModel())
    }
}

