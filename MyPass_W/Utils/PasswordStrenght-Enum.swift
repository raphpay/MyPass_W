//
//  PasswordStrenght-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import SwiftUI

enum PasswordStrenght {
    case weak, mediocre, strong, veryStrong
    
    var title: String {
        switch self {
        case .weak:
            return "Weak"
        case .mediocre:
            return "Mediocre"
        case .strong:
            return "Strong"
        case .veryStrong:
            return "Very Strong"
        }
    }
    
    var range: ClosedRange<Double> {
        switch self {
        case .weak:
            return 1...7
        case .mediocre:
            return 7...12
        case .strong:
            return 12...24
        case .veryStrong:
            return 24...40
        }
    }
    
    var color: Color {
        switch self {
        case .weak:
            return Color.ui.weak
        case .mediocre:
            return Color.ui.mediocre
        case .strong:
            return Color.ui.strong
        case .veryStrong:
            return Color.ui.veryStrong
        }
    }
}
