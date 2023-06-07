//
//  PasswordList.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI

struct PasswordList: View {
    
    var body: some View {
        // TODO: Review the Login UI
        ZStack {
            PWLoginBackground(showIcon: false)
            VStack() {
                HStack {
                    Spacer()
                    Button {
                        //
                    } label: {
                        SettingsButtonLabel()
                    }
                }
                
                ScrollView {
                    scrollViewContent
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
        PasswordList()
    }
}

// TODO: Create separate files
struct SettingsButtonLabel: View {
    
    let settingsButtonSize: CGFloat = 50
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .frame(width: settingsButtonSize)
            
            Image(systemName: SFSymbols.settings.rawValue)
                .resizable()
                .frame(width: settingsButtonSize / 2, height: settingsButtonSize / 2)
        }
        .tint(.black)
    }
}



struct InlineButton: View {
    
    var icon: String
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal, 4)
    }
}
