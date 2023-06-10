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
    
    static let sample = Credential(website: "www.apple.com", username: "Raphpay", password: "helloworld")
    static let samples = [Credential(website: "www.apple.com", username: "Raphpay", password: "helloworld"), sample]
}

struct MockCredential: Identifiable {
    var id = UUID()
    var website: String
    var username: String
    var password: String
    
    static let sample = MockCredential(website: "www.apple.com", username: "Raphpay", password: "helloworld")
    static let samples = [sample, MockCredential(website: "www.apple.com", username: "Raphpay", password: "helloworld")]
}
