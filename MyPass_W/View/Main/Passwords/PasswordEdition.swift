//
//  PasswordEdition.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI
import RealmSwift

struct PasswordEdition: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var website: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            PWTextField(placeholder: "Website", value: $website)
            PWTextField(placeholder: "Username", value: $username)
            PWSecureTextField(placeholder: "Password", value: $password)
            
            RoundedButton(title: "Save password") {
                // Save password into Realm
                saveCredentials()
                // Go back
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
    
    // TODO: Create separate file
    func saveCredentials() {
        do {
            let realm = try Realm()
            
            // TODO: Block writing if no value
            // TODO: Encrypt password
            try realm.write {
                let entry = Credential(website: website, username: username, password: password)
                realm.add(entry)
            }
            
            website = ""
            username = ""
            password = ""
            
        } catch let error as NSError {
            print("Failed to save entry: \(error.localizedDescription)")
        }
    }
}

struct PasswordEdition_Previews: PreviewProvider {
    static var previews: some View {
        PasswordEdition()
    }
}

