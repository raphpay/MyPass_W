//
//  MyPass_WApp.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 17/05/2022.
//

import SwiftUI

@main
struct MyPass_WApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
    }
}
