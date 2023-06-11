//
//  CircleImage.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import SwiftUI

struct CircleImage: View {
    
    var icon: String
    var color: Color = .blue
    let buttonSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: buttonSize)
                .foregroundColor(color)
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: buttonSize/2, height: buttonSize/2)
                .foregroundColor(.white)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(icon: SFSymbols.lockShield.rawValue)
    }
}
