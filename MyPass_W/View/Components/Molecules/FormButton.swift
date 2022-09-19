//
//  FormButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import SwiftUI

struct FormButton: View {
    
    var title: LocalizedStringKey
    var icon: String
    var action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            Label(title, systemImage: icon)
        }
        .tint(.black)
    }
}

struct FormButton_Previews: PreviewProvider {
    static var previews: some View {
        FormButton(title: "Hello", icon: "lock") {
            //
        }
    }
}
