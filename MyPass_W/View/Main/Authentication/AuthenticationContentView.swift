//
//  AuthenticationContentView.swift
//  Firebase-Auth-SwiftUI-Template
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI

struct AuthenticationContentView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            if authViewModel.isLoggedIn {
                // Navigate to the main screen
                LogoutView(authViewModel: authViewModel)
            } else {
                LoginView(authViewModel: authViewModel)
            }
        }
    }
}
