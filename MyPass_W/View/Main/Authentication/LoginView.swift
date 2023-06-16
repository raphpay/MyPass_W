//
//  LoginView.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isRegistrationActive = false

    var body: some View {
        ZStack {
            PWLoginBackground()
            
            VStack {
                Spacer()
                
                VStack {
                    PWText(text: "My Pass_W", fontSize: 25)
                    PWText(text: "Access your account", fontSize: 16, color: .secondary)
                }
                
                VStack {
                    PWTextField(placeholder: "Email", value: $email, keyboardType: .emailAddress)
                    PWSecureTextField(placeholder: "Password", value: $password)
                }
                
                Spacer()
                    .frame(height: 50)
                
                RoundedButton(title: "Sign in", color: .black) {
                    authViewModel.signIn(email: email, password: password) { success in
                        print("Sign in result", success)
                    }
                }
                
                PWText(text: "or", fontSize: 16, color: .secondary)
                    .padding(.top)
                NavigationLink(
                    destination: RegistrationView(authViewModel: authViewModel),
                    isActive: $isRegistrationActive,
                    label: { EmptyView() }
                )
                .hidden()
                
                PWTextButton {
                    isRegistrationActive = true
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel())
    }
}
