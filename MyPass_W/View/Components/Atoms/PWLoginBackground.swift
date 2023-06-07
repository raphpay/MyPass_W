//
//  PWLoginBackground.swift
//  MyPass_W
//
//  Created by Personal on 01/06/2023.
//

import SwiftUI

struct PWLoginBackground: View {
    
    let iconSize: CGFloat = 90
    var showIcon = true
    
    var body: some View {
        VStack {
            ZStack {
                Image(Assets.loginBackground.name)
                    .resizable()
                    .frame(height: 275)
                
                if (showIcon) {
                    Image(Assets.appIcon.name)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct PWLoginBackground_Previews: PreviewProvider {
    static var previews: some View {
        PWLoginBackground()
    }
}
