//
//  KeychainHelper.swift
//  MyPass_W
//
//  Created by Personal on 02/06/2023.
//

import Foundation
import Security

class KeychainHelper {
    static func storePassword(username: String, password: String) -> OSStatus? {
        guard let passwordData = password.data(using: .utf8) else {
            return nil
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: passwordData
        ]

        return SecItemAdd(query as CFDictionary, nil)
    }
    
    static func retrievePassword(username: String) -> String? {
        var password: String?
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: username,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess,
           let passwordData = result as? Data {
            password = String(data: passwordData, encoding: .utf8)
        }
        
        return password
    }
}
