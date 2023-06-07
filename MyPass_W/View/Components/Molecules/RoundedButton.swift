//
//  RoundedButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import SwiftUI

struct RoundedButton: View {
    
    let title: LocalizedStringKey
    var color: Color = .blue
    var width: CGFloat = 225
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            PWText(text: title, fontSize: 25, color: .white)
                .frame(width: width, height: 55)
                .background(color)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .padding(.horizontal)
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
