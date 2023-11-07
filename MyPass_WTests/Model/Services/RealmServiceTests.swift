//
//  RealmServiceTests.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
import RealmSwift
@testable import MyPass_W

final class RealmServiceTests: XCTestCase {

    var realm: Realm!
    var realmService: RealmService!
    
    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "RealmServiceTests"))
        realmService = RealmService(realm: realm)
    }

    override func tearDown() {
        try! realm.write({
            realm.deleteAll()
        })
        realm = nil
        realmService = nil
        
        super.tearDown()
    }
    
    func testCorrectCredentialIsSaved() {
        // Given
        let credential = Credential.sample
        // When
        realmService.saveCredentials(credential: credential)
        // Then
        let storedCredentials = realm.objects(Credential.self)
        XCTAssertEqual(storedCredentials.count, 1)
        XCTAssertEqual(storedCredentials.first?.website, credential.website)
        XCTAssertEqual(storedCredentials.first?.username, credential.username)
        XCTAssertEqual(storedCredentials.first?.password, credential.password)
    }
}
