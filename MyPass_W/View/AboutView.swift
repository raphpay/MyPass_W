//
//  AboutView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import SwiftUI

struct AboutView: View {
    
    
    
    var body: some View {
        VStack {
            
            Text("Where to find me ?")
            
            HStack {
                VStack {
                    Image("github")
                        .resizable()
                        .frame(width: 55, height: 55)
                    Text("GitHub")
                }
                
                // Add other links
            }
            
            VStack(alignment: .leading) {
                Text("About Me")
                Text("A short resumee of myself")
            }
            .padding()
            .background(Color.ui.lightGray)
            .cornerRadius(10)
            
        }.navigationTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
