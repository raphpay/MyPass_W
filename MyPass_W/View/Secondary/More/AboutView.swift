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
                PWText(text: i18n.questionFindMe.translation, fontSize: 25)
                
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
                PWText(text: i18n.aboutMe.translation)
                PWText(text: i18n.myResume.translation)
            }
            .padding()
            .background(Color.ui.lightGray)
            .cornerRadius(10)
            
            Spacer()
            
        }
        .navigationTitle(i18n.about.translation)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
