//
//  Logo-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 27/05/2022.
//

import Foundation

enum Assets {
    case loginBackground, appIcon
    
    var name: String {
        switch self {
        case .loginBackground:
            return "Login_Background_image"
        case .appIcon:
            return "AppIcon_Login"
        }
    }
}

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
