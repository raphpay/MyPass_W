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
        ZStack {
            VStack {
                LoginBackground()
                
                PWText(text: "My Pass_W", fontSize: 25)
                PWText(text: "Access your account", fontSize: 16, color: .secondary)
                
                PWTextField(placeholder: "Email", value: $email, keyboardType: .emailAddress)
                PWSecureTextField(placeholder: "Password", value: $password)
                
                Spacer()
                    .frame(height: 50)
                
                RoundedButton(title: "Sign In", action: {
                    // Sign in action
                    print("Sign in")
                }, color: .black)
                
                PWText(text: "or", fontSize: 16, color: .secondary)
                    .padding(.top)
                // TODO: Convert this text into a button
                PWText(text: "Create an account", fontSize: 20, color: .secondary, underlined: true)
                    .padding(.top)
                    .onTapGesture {
                        print("Create an account")
                    }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $navigateToLogoutView) {
            LogoutView(authViewModel: authViewModel)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel())
    }
}

// TODO: Extract subview into another folder
struct LoginBackground: View {
    
    let iconSize: CGFloat = 90
    
    var body: some View {
        ZStack {
            Image(Assets.loginBackground.name)
                .resizable()
                .frame(height: 275)
            
            Image(Assets.appIcon.name)
                .resizable()
                .frame(width: iconSize, height: iconSize)
        }
    }
}
