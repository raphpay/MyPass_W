//
//  Password.swift
//  MyPass_W
//
//  Created by Personal on 09/06/2023.
//

import Foundation
import RealmSwift

class Credential: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var website: String
    @Persisted var username: String
    @Persisted var password: String
    
    convenience init(website: String, username: String, password: String) {
        self.init()
        self.website = website
        self.username = username
        self.password = password
    }
}
