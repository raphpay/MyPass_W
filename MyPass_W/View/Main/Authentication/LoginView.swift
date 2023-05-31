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

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Log In") {
                authViewModel.signIn(email: email, password: password) { success in
                    if success {
                        navigateToLogoutView = true
                    } else {
                        // Handle login error
                    }
                }
            }
            .padding()
            
            Button("Create User") {
                authViewModel.createUser(email: email, password: password) { success in
                    print("create user", success)
                    if success {
                        navigateToLogoutView = true
                    } else {
                        // Handle login error
                    }
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $navigateToLogoutView) {
            TestLogoutView(authViewModel: authViewModel)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel())
    }
}
