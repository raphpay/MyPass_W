//
//  RealmService.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import Foundation
import RealmSwift

class RealmService {
    
    public static let shared = RealmService()

      private init() {}
    
    func saveCredentials(credential: Credential) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(credential)
            }
        } catch let error as NSError {
            print("Failed to save entry: \(error.localizedDescription)")
        }
    }
}
