//
//  i18n-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation

enum i18n {
    case generate, textfield, weak, mediocre, strong, veryStrong
    case copy, copied, notCopied
    case more
    
    var translation: String {
        switch self {
        case .generate:
            // TODO: Convert this simple return into LocalisedString
            return "i18n-generate"
        case .copy:
            return "i18n-copy"
        case .copied:
            return "i18n-copied"
        case .notCopied:
            return "i18n-not-copied"
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
        case .more:
            return "i18n-more"
        }
    }
}
