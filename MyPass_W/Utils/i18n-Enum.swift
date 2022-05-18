//
//  i18n-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation

enum i18n {
    case generate, copy, textfield
    
    var translation: String {
        switch self {
        case .generate:
            return "i18n-generate"
        case .copy:
            return "i18n-copy"
        case .textfield:
            return "i18n-textField"
        }
    }
}
