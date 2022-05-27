//
//  MoreView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 25/05/2022.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject private var viewModel = MoreViewViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    FormButton(title: i18n.verifyStrength.translation, icon: SFSymbols.networkShield.rawValue) {
                        viewModel.showingSheet.toggle()
                    }
                }
                
                Section {
                    FormButton(title: i18n.rate.translation, icon: SFSymbols.starBubble.rawValue) {
                        viewModel.showAlert.toggle()
                    }
                    
                    FormButton(title: i18n.share.translation, icon: SFSymbols.share.rawValue) {
                        viewModel.shareSheet()
                    }
                    
                }
                
                Section {
                    NavigationLink {
                        AboutView()
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
            .sheet(isPresented: $viewModel.showingSheet) {
                PasswordStrengthView()
            }
            .alert("Do you like the app ?", isPresented: $viewModel.showAlert) {
                Button("No", role: .destructive) { }
                Button("Yes") { viewModel.askForReview() }
            }
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
