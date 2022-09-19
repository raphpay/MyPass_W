//
//  i18n-Enum.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import SwiftUI

enum i18n {
    case generate
    case textfield, weak, mediocre, strong, veryStrong
    case copy, copied, notCopied
    case more
    case verifyStrength, verify
    case rate, share
    case aboutDev, about
    case donate
    case infoWeak, infoMediocre, infoStrong, infoVeryStrong
    case questionLike, no, yes, questionFindMe
    case aboutMe, myResume
    
    var translation: LocalizedStringKey {
        switch self {
        case .generate:
            return LocalizedStringKey("i18n-generate")
        case .copy:
            return LocalizedStringKey("i18n-copy")
        case .copied:
            return LocalizedStringKey("i18n-copied")
        case .notCopied:
            return LocalizedStringKey("i18n-not-copied")
        case .textfield:
            return LocalizedStringKey("i18n-textField")
        case .weak:
            return LocalizedStringKey("i18n-weak")
        case .mediocre:
            return LocalizedStringKey("i18n-mediocre")
        case .strong:
            return LocalizedStringKey("i18n-strong")
        case .veryStrong:
            return LocalizedStringKey("i18n-veryStrong")
        case .more:
            return LocalizedStringKey("i18n-more")
        case .verifyStrength:
            return LocalizedStringKey("i18-verify-password-strength")
        case .verify:
            return LocalizedStringKey("i18-verify")
        case .rate:
            return LocalizedStringKey("i18-rate")
        case .share:
            return LocalizedStringKey("i18n-share")
        case .aboutDev:
            return LocalizedStringKey("i18n-about-dev")
        case .donate:
            return LocalizedStringKey("i18n-donate")
        case .infoWeak:
            return LocalizedStringKey("i18n-password-info-weak")
        case .infoMediocre:
            return LocalizedStringKey("i18n-password-info-mediocre")
        case .infoStrong:
            return LocalizedStringKey("i18n-password-info-strong")
        case .infoVeryStrong:
            return LocalizedStringKey("i18n-password-info-very-strong")
        case .questionLike:
            return LocalizedStringKey("i18n-question-like")
        case .questionFindMe:
            return LocalizedStringKey("i18n-question-find-me")
        case .no:
            return LocalizedStringKey("i18n-no")
        case .yes:
            return LocalizedStringKey("i18n-yes")
        case .aboutMe:
            return LocalizedStringKey("i18n-about-me")
        case .myResume:
            return LocalizedStringKey("i18n-my-resume")
        case .about:
            return LocalizedStringKey("i18n-about")
        }
    }
}
