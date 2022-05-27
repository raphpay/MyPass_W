//
//  AboutView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        ScrollView {
            
            HStack {
                PWText(text: "Where to find me ?", fontSize: 25)
                
                Spacer()
            }
            .padding(.leading)
            
            HStack(spacing: 40) {
                LogoCard(logo: .linkedIn)
                
                LogoCard(logo: .github)
                
                LogoCard(logo: .instagram)
            }
            
            Spacer()
                .frame(height: 100)
            
            VStack(alignment: .leading) {
                Text("About Me")
                Text("A short resumee of myself")
            }
            .padding()
            .background(Color.ui.lightGray)
            .cornerRadius(10)
            
            Spacer()
            
        }
        .navigationTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
