//
//  PasswordList.swift
//  MyPass_W
//
//  Created by Personal on 30/05/2023.
//

import SwiftUI

struct PasswordList: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State private var screenSelection: String?
    
    var body: some View {
        ZStack {
            // TODO: Review the Login UI
            PWLoginBackground(showIcon: false)
            VStack() {
                HStack {
                    Spacer()
                    NavigationLink(destination: MoreView(authViewModel: authViewModel),
                                   tag: ScreenNavigation.moreView.rawValue,
                                   selection: $screenSelection) {
                        EmptyView()
                    }
                    Button {
                        screenSelection = ScreenNavigation.moreView.rawValue
                    } label: {
                        SettingsButtonLabel()
                    }
                }
                Spacer()
                
                NavigationLink(destination: PasswordEdition(), tag: ScreenNavigation.passwordEditionView.rawValue, selection: $screenSelection) {
                    EmptyView()
                }
                RoundedButton(title: "Save password") {
                    screenSelection = ScreenNavigation.passwordEditionView.rawValue
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
