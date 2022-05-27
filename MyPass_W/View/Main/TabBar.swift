//
//  TabView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView {
            GeneratorView()
                .tabItem {
                    Label("i18n-generate", systemImage: "lock.shield")
                }
            
            
            MoreView()
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
            TabBar()
                .environment(\.locale, .init(identifier: "en_EN"))
            TabBar()
                .environment(\.locale, .init(identifier: "fr_FR"))
        }
    }
}
