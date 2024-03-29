//
//  AppLogo.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
        HStack {
            Image(systemName: SFSymbols.lockShield.rawValue)
                .font(.custom(Fonts.secularOne.rawValue, size: 28))
            PWText(text: "My Pass_W", fontSize: 28)
            Spacer()
        }.padding()
            .foregroundColor(.white)
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
