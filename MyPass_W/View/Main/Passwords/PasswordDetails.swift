//
//  PasswordDetails.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI
import RealmSwift

struct PasswordDetails: View {
    
    @ObservedRealmObject var credential: Credential
    
    var body: some View {
        VStack {
            Text(credential.website)
            Text(credential.username)
        }
    }
}

struct PasswordDetails_Previews: PreviewProvider {
    static var previews: some View {
        PasswordDetails(credential: Credential.sample)
    }
}
