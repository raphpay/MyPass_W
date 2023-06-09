//
//  SettingsButtonLabel.swift
//  MyPass_W
//
//  Created by Personal on 09/06/2023.
//

import SwiftUI

struct SettingsButtonLabel: View {
    
    let settingsButtonSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .frame(width: settingsButtonSize)
            
            Image(systemName: SFSymbols.settings.rawValue)
                .resizable()
                .frame(width: settingsButtonSize / 2, height: settingsButtonSize / 2)
        }
        .tint(.black)
    }
}

struct SettingsButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonLabel()
    }
}
