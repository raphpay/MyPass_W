//
//  PasswordStrength-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import SwiftUI

enum PasswordStrength {
    case weak, mediocre, strong, veryStrong, none
    
    var title: LocalizedStringKey {
        switch self {
        case .weak:
            return i18n.weak.translation
        case .mediocre:
            return i18n.mediocre.translation
        case .strong:
            return i18n.strong.translation
        case .veryStrong:
            return i18n.veryStrong.translation
        case .none:
            return ""
        }
    }
    
    var range: ClosedRange<Double> {
        switch self {
        case .weak:
            return 1...8
        case .mediocre:
            return 8...12
        case .strong:
            return 12...24
        case .veryStrong:
            return 24...40
        case .none:
            return 0...1
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
        case .none:
            return Color.black
        }
    }
}
