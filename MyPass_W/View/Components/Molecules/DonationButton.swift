//
//  DonationButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 21/09/2022.
//

import SwiftUI

struct DonationButton: View {
    let icon: LocalizedStringKey
    let text: LocalizedStringKey
    let price: Double
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                PWText(text: icon, fontSize: 50)
                PWText(text: text, fontSize: 18)
                    .padding(.horizontal)
                PWText(text: "\(String(format: "%.2f", price))€", fontSize: 25)
            }
            .foregroundColor(.primary)
            .padding()
            .background(Color.ui.lightGray)
            .cornerRadius(20)
        }
    }
}

struct DonationButton_Previews: PreviewProvider {
    static var previews: some View {
        DonationButton(icon: "☕️", text: "i18n-buy-beer", price: 3.99) {
            //
        }
    }
}
