//
//  Logo-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import Foundation

enum Logo {
    case github, linkedIn, instagram
    
    var name: String {
        switch self {
        case .github:
            return "GitHub"
        case .linkedIn:
            return "LinkedIn"
        case .instagram:
            return "Instagram"
        }
    }
    
    var link: String {
        switch self {
        case .github:
            return "https://github.com/raphpay"
        case .linkedIn:
            return "https://www.linkedin.com/in/raphael-payet"
        case .instagram:
            return "https://www.instagram.com/raphbmx/"
        }
    }
}
