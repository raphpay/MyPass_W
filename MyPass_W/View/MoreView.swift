//
//  MoreView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Verify password strength")
                }
                
                Section {
                    Text("Rate the app")
                    Text("Share the app")
                }
                
                Section {
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text("Verify password strength")
                    }
                    
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text("Donate")
                    }
                }
            }
            .navigationTitle(LocalizedStringKey(i18n.more.translation))
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
