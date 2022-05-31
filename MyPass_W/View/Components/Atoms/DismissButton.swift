//
//  DismissButton.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 31/05/2022.
//

import SwiftUI

struct DismissButton: View {
    
    var action: (() -> Void)
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                action()
            } label: {  
                Image(systemName: SFSymbols.close.rawValue)
                    .foregroundColor(Color(uiColor: .label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton { }
    }
}
