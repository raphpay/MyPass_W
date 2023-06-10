//
//  CircleButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import SwiftUI

struct CircleButton: View {
    
    var icon: String
    var color: Color = .blue
    var action : (() -> Void)?
    let buttonSize: CGFloat = 50
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                Circle()
                    .frame(width: buttonSize)
                    .foregroundColor(color)
                Image(systemName: icon)
                    .resizable()
                    .frame(width: buttonSize/2, height: buttonSize/2)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: SFSymbols.plus.rawValue)
    }
}
