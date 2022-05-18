//
//  i18n-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation

enum i18n {
    case generate, copy, textfield, weak, mediocre, strong, veryStrong
    
    var translation: String {
        switch self {
        case .generate:
            return "i18n-generate"
        case .copy:
            return "i18n-copy"
        case .textfield:
            return "i18n-textField"
        case .weak:
            return "i18n-weak"
        case .mediocre:
            return "i18n-mediocre"
        case .strong:
            return "i18n-strong"
        case .veryStrong:
            return "i18n-veryStrong"
        }
    }
}
