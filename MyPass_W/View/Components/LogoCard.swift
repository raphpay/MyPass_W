//
//  LogoCard.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import SwiftUI

enum Logo {
    case github, linkedIn, instagram
    
    var name: String {
        switch self {
        case .github:
            return "GitHub"
        case .linkedIn:
            return "LinkedIn"
        case .instagram:
            return "Instagram"
        }
    }
    
    var link: String {
        switch self {
        case .github:
            return "https://github.com/raphpay"
        case .linkedIn:
            return "https://www.linkedin.com/in/raphael-payet"
        case .instagram:
            return "https://www.instagram.com/raphbmx/"
        }
    }
}

struct LogoCard: View {
    
    var logo: Logo = .github
    
    @State private var showSafari: Bool = false
    @State private var websiteToShow: String = ""
    
    var body: some View {
        Button {
            showSafari.toggle()
        } label: {
            VStack {
                Image(logo.name)
                    .resizable()
                    .frame(width: 55, height: 55)
                
                Text(logo.name)
            }
            .tint(.black)
        }
        .padding()
        .fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper(url: URL(string: logo.link)!)
        })
    }
}

struct LogoCard_Previews: PreviewProvider {
    static var previews: some View {
        LogoCard(logo: .github)
    }
}
