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
    
    // TODO: Get the real url when app is first published
    let appShareURL = "https://itunes.apple.com/us/app/keynote/id361285480?mt=8"
    
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
                        shareSheet()
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
    
    func shareSheet() {
        guard let urlShare = URL(string: appShareURL) else { return }
        
//        if <ios15
//        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
//        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true)
        
        let activityView = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)

        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }
        
        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
