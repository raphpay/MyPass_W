//
//  PasswordList.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI
import RealmSwift

struct PasswordList: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State private var screenSelection: String?
    @ObservedResults(Credential.self) var credentials
    
    var body: some View {
        ZStack {
            // TODO: Review the Login UI
            PWLoginBackground(showIcon: false)
            VStack() {
                HStack {
                    Spacer()
                    // Commented after #20
//                    NavigationLink(destination: MoreView(authViewModel: authViewModel)) {
//                        SettingsButtonLabel()
//                    }
                    NavigationLink(destination: MoreView()) {
                        SettingsButtonLabel()
                    }
                }
                
                ScrollView {
                    ForEach(credentials) { credential in
                        NavigationLink {
                            PasswordDetails(credential: credential)
                        } label: {
                            CredentialRow(credential: credential)
                                .tint(.black)
                        }

                    }
                }
                
                Spacer()
                
                HStack(spacing: 8) {
                    Spacer()
                    
                    NavigationLink(destination: GeneratorView()) {
                        CircleImage(icon: SFSymbols.lockShield.rawValue)
                    }
                    
                    NavigationLink {
                        PasswordEdition()
                    } label: {
                        CircleImage(icon: SFSymbols.plus.rawValue)
                    }

                }

            }
            .padding(.horizontal)
        }
    }
    
    var scrollViewContent: some View {
        VStack {
            HStack {
                PWText(text: "Tools")
                Spacer()
            }
            RoundedButton(title: "Generate a password", width: .infinity) {
                //
            }
            
            HStack {
                PWText(text: "Your password")
                Spacer()
                InlineButton(icon: SFSymbols.plus.rawValue)
                InlineButton(icon: SFSymbols.search.rawValue)
            }
            .frame(height: 50)
            
            ZStack {
                // TODO: Create color from palette
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black.opacity(0.2))
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading) {
                        PWText(text: "Account Name", fontSize: 18)
                        PWText(text: "Username", fontSize: 16)
                    }
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: SFSymbols.copy.rawValue)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(.black.opacity(0.5))
                    }
                }
                .padding()
            }
        }
    }
}

struct PasswordList_Previews: PreviewProvider {
    static var previews: some View {
        PasswordList(authViewModel: AuthViewModel())
    }
}
