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
                    FormButton(title: "Verify password strength", icon: "network.badge.shield.half.filled") {
                        showingSheet.toggle()
                    }
                }
                
                Section {
                    FormButton(title: "Rate the app", icon: "star.bubble.fill") {
                        print("button")
                    }
                    
                    FormButton(title: "Share the app", icon: "square.and.arrow.up") {
                        print("button")
                    }
                    
                }
                
                Section {
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text("Verify password strength")
                    }
                    
                    NavigationLink {
                        Text("Screen 2")
                    } label: {
                        Text("Donate")
                    }
                }
            }
            .navigationTitle(LocalizedStringKey(i18n.more.translation))
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
