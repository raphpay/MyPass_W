//
//  ReviewHandler.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 26/05/2022.
//

import Foundation
import StoreKit
import SwiftUI

class ReviewHandler {
    static func requestReview() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}
