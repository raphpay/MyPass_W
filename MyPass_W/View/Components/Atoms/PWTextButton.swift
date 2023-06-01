//
//  PWTextButton.swift
//  MyPass_W
//
//  Created by Personal on 01/06/2023.
//

import SwiftUI

struct PWTextButton: View {
    
    var action: (() -> Void)?
    var title: LocalizedStringKey = "Create an account"
    
    var body: some View {
        Button {
            action?()
        } label: {
            PWText(text: title, fontSize: 20, color: .secondary, underlined: true)
                .padding(.top)
        }

    }
}

struct PWTextButton_Previews: PreviewProvider {
    static var previews: some View {
        PWTextButton()
    }
}
