//
//  PasswordEditionViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import Foundation
import RealmSwift

class PasswordEditionViewModel: ObservableObject {
    @Published var website: String = ""
    @Published var username: String = ""
    @Published var password: String = ""

    func saveCredentials() {
        guard website != "" else {
            print("Website entry is empty.")
            return
        }

        guard username != "" else {
            print("Username entry is empty.")
            return
        }
        
        // TODO: Encrypt password
        guard password != "" else {
            print("Password entry is empty.")
            return
        }
        
        let credential = Credential(website: website, username: username, password: password)
        let realmService = RealmService.shared
        realmService.saveCredentials(credential: credential)
    }
}
