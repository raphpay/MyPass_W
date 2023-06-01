//
//  PWLoginBackground.swift
//  MyPass_W
//
//  Created by Personal on 01/06/2023.
//

import SwiftUI

struct PWLoginBackground: View {
    
    let iconSize: CGFloat = 90
    
    var body: some View {
        ZStack {
            Image(Assets.loginBackground.name)
                .resizable()
                .frame(height: 275)
            
            Image(Assets.appIcon.name)
                .resizable()
                .frame(width: iconSize, height: iconSize)
        }
    }
}


struct PWLoginBackground_Previews: PreviewProvider {
    static var previews: some View {
        PWLoginBackground()
    }
}
