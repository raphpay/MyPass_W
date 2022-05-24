//
//  View+Ext.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 24/05/2022.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

