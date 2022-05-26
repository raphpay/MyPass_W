//
//  MoreView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI

struct MoreView: View {
    
    @State private var showingSheet = false
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    FormButton(title: i18n.verifyStrength.translation, icon: "network.badge.shield.half.filled") {
                        showingSheet.toggle()
                    }
                }
                
                Section {
                    FormButton(title: i18n.rate.translation, icon: "star.bubble.fill") {
                        print("button")
                    }
                    
                    FormButton(title: i18n.share.translation, icon: "square.and.arrow.up") {
                        print("button")
                    }
                    
                }
                
                Section {
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text(i18n.about.translation)
                    }
                    
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text(i18n.donate.translation)
                    }
                }
            }
            .navigationTitle(i18n.more.translation)
            .sheet(isPresented: $showingSheet) {
                PasswordStrengthView()
            }
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
