//
//  Swift+Ext.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 18/05/2022.
//

import Foundation

extension String {
    func random(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension String.Element {    
    func isSymbol() -> Bool {
        let symbols = "!£$%&/()=?^;:ç°§*,.-_€@#"
        if symbols.contains(self) {
            return true
        }
        
        return false
    }
}
