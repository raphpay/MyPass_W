//
//  PWText.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct PWText: View {
    
    var text: LocalizedStringKey
    var fontSize: CGFloat = 20
    var tableName: String?
    var color: Color = .primary
    var underlined: Bool = false
    
    var body: some View {
        Text(text, tableName: tableName)
            .font(.custom(Fonts.secularOne.rawValue, size: fontSize))
            .underline(underlined)
            .foregroundColor(color)
    }
}

struct PWText_Previews: PreviewProvider {
    static var previews: some View {
        PWText(text: "Hello World")
    }
}
