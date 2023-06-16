//
//  TabBar.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 16/06/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            GeneratorView()
                .tabItem {
                    Label("Generator", systemImage: SFSymbols.lockShield.rawValue)
                }
            MoreView()
                .tabItem {
                    Label("More View", systemImage: SFSymbols.starBubble.rawValue)
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
