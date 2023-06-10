//
//  CredentialRow.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import SwiftUI

struct CredentialRow: View {
    let credential: Credential
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(credential.website)
                Text(credential.username)
            }
            Spacer()
        }
    }
}

struct CredentialRow_Previews: PreviewProvider {
    static var previews: some View {
        CredentialRow(credential: Credential.sample)
    }
}
