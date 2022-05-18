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
            Image(systemName: "lock.shield")
                .font(.custom(Fonts.secularOne.rawValue, size: 28))
            Text("My Pass_W")
                .font(.custom(Fonts.secularOne.rawValue, size: 28))
            Spacer()
        }.padding()
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
