//
//  PWText.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct PWText: View {
    
    var text: String
    var fontSize: CGFloat = 20
    var tableName: String?
    
    var body: some View {
        Text(LocalizedStringKey(text), tableName: tableName)
            .font(.custom(Fonts.secularOne.rawValue, size: fontSize))
            .scaledToFit()
            .minimumScaleFactor(0.7)
    }
}

struct PWText_Previews: PreviewProvider {
    static var previews: some View {
        PWText(text: "Hello World")
    }
}
