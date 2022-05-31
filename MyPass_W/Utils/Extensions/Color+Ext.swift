//
//  Color+Ext.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let ui = Color.Custom()
    
    struct Custom {
        let weak = Color("Weak")
        let mediocre = Color("Mediocre")
        let strong = Color("Strong")
        let veryStrong = Color("Very-Strong")
        let lightGray = Color("LightGray")
    }
}
