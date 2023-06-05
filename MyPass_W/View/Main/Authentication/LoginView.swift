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
    @State private var navigateToLogoutView = false
    @State private var isRegistrationActive = false

    var body: some View {
        ZStack {
            VStack {
                PWLoginBackground()
                
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
                
                RoundedButton(title: "Sign In", action: {
                    authViewModel.signIn(email: email, password: password) { success in
                        if (success) {
                            // TODO: Remove the navigation logic
//                            navigateToLogoutView = true
                        } else {
                            // Show error
                        }
                    }
                }, color: .black)
                
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
        .fullScreenCover(isPresented: $navigateToLogoutView) {
//            TabBar(authViewModel: authViewModel)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel())
    }
}
