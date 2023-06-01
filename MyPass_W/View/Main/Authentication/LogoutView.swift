//
//  LogoutView.swift
//  MyPass_W
//
//  Created by Personal on 31/05/2023.
//

import SwiftUI

struct LogoutView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var navigateToLoginView = false

    var body: some View {
        Button("Log Out") {
            let logoutResult = authViewModel.signOut()
            if (logoutResult) {
                navigateToLoginView = true
            }
        }
        .padding()
        .fullScreenCover(isPresented: $navigateToLoginView) {
            LoginView(authViewModel: authViewModel)
        }
    }
}


struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView(authViewModel: AuthViewModel())
    }
}
