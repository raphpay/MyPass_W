//
//  StrengthCard.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct StrengthCard: View {
    
    var strength: PasswordStrength
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // TODO: Create a text component with custom font
                Text(LocalizedStringKey(strength.title))
                    .bold()
                    .font(.custom(Fonts.secularOne.rawValue, size: 25))
                Text("Infos about strength")
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            Spacer()
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(strength.color)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct StrengthCard_Previews: PreviewProvider {
    static var previews: some View {
        StrengthCard(strength: .weak)
    }
}
