//
//  AuthViewModel.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false

    init() {
        // Check if the user is already logged in
        isLoggedIn = Auth.auth().currentUser != nil
    }
    
    func createUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            self.isLoggedIn = true
            completion(true)
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            self.isLoggedIn = true
            completion(true)
        }
    }

    func signOut() -> Bool {
        var result = false
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
            result = true
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
        return result
    }
}
