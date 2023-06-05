//
//  TabView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI

struct TabBar: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            GeneratorView()
                .tabItem {
                    Label("i18n-generate", systemImage: "lock.shield")
                }
            
            
            MoreView(authViewModel: authViewModel)
                .tabItem {
                    Label("i18n-more", systemImage: "ellipsis.bubble")
                }
        }
        .accentColor(.black)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar(authViewModel: AuthViewModel())
                .environment(\.locale, .init(identifier: "en_EN"))
            TabBar(authViewModel: AuthViewModel())
                .environment(\.locale, .init(identifier: "fr_FR"))
        }
    }
}
