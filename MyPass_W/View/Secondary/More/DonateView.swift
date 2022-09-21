//
//  DonateView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import SwiftUI

struct DonateView: View {
    var body: some View {
        VStack {
            PWText(text: "i18n-donate-description", fontSize: 18)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
            
            Spacer()
                .frame(height: 100)
            
            DonationButton(icon: "☕️", text: "i18n-buy-coffee", price: 0.99) {
                //
            }
            DonationButton(icon: "🍺", text: "i18n-buy-beer", price: 3.99) {
                //
            }
            DonationButton(icon: "🍔", text: "i18n-buy-burger", price: 7.99) {
                //
            }
            
            Spacer()
        }
        .navigationTitle(Text("i18n-donate"))
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        DonateView()
    }
}
