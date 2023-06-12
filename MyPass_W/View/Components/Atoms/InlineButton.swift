//
//  InlineButton.swift
//  MyPass_W
//
//  Created by Personal on 09/06/2023.
//

import SwiftUI

struct InlineButton: View {
    
    var icon: String
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 4)
    }
}

struct InlineButton_Previews: PreviewProvider {
    static var previews: some View {
        InlineButton(icon: SFSymbols.copy.rawValue)
    }
}
