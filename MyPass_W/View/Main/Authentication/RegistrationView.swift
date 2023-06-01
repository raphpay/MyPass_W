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
    @State private var passwordConfirmation: String = ""
    @ObservedObject var authViewModel: AuthViewModel
    @State private var navigateToLogoutView = false

    var body: some View {
        ZStack {
            VStack {
                PWLoginBackground()
                
                PWText(text: "My Pass_W", fontSize: 25)
                PWText(text: "Create your account", fontSize: 16, color: .secondary)
                
                PWTextField(placeholder: "Email", value: $email, keyboardType: .emailAddress)
                PWSecureTextField(placeholder: "Password", value: $password)
                
                Spacer()
                    .frame(height: 50)
                
                RoundedButton(title: "Create account", action: {
                    // Sign in action
                    print("Create account")
                }, color: .black)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $navigateToLogoutView) {
            LogoutView(authViewModel: authViewModel)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(authViewModel: AuthViewModel())
    }
}

