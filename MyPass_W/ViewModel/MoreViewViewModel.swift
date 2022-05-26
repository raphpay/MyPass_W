//
//  MoreViewViewModel.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//
//  All rights reserved
//

import Foundation
import UIKit

final class MoreViewViewModel: ObservableObject {
  // MAARK: - Properties
    @Published var showingSheet = false
    @Published var showAlert = false
    
    // TODO: Get the real url when app is first published
    let appShareURL = "https://itunes.apple.com/us/app/keynote/id361285480?mt=8"
}

// MARK: - Functions
extension MoreViewViewModel {
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
