//
//  MoreView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI
import StoreKit

struct MoreView: View {
    
    @State private var showingSheet = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    FormButton(title: i18n.verifyStrength.translation, icon: SFSymbols.networkShield.rawValue) {
                        showingSheet.toggle()
                    }
                }
                
                Section {
                    FormButton(title: i18n.rate.translation, icon: SFSymbols.starBubble.rawValue) {
                        showAlert.toggle()
                    }
                    
                    FormButton(title: i18n.share.translation, icon: SFSymbols.share.rawValue) {
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
            .alert("Do you like the app ?", isPresented: $showAlert) {
                Button("No", role: .destructive) { }
                Button("Yes") { askForReview() }
            }
        }
    }
    
    func askForReview() {
        ReviewHandler.requestReview()
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
