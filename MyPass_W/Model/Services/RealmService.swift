//
//  RealmService.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import Foundation
import RealmSwift

public class RealmService {
    
    var realm: Realm?
    public static let shared = RealmService()
    
    private init() {
        self.realm = try? Realm()
    }
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func saveCredentials(credential: Credential) {
        do {
            guard let realm = self.realm else { return }
            try realm.write {
                realm.add(credential)
            }
        } catch let error as NSError {
            print("Failed to save entry: \(error.localizedDescription)")
        }
    }
}
