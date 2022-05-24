//
//  RoundedButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct RoundedButton: View {
    
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(LocalizedStringKey(title))
                .font(.custom(Fonts.secularOne.rawValue, size: 25))
                .frame(width: 225, height: 55)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
        }

    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Button") {
            print("Button Tapped")
        }
    }
}
