//
//  GeneratorViewModel+GeneratePassword.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
@testable import MyPass_W

extension GeneratorViewModelTests {
    func generatePasswordContainsCorrectNumberOfCharactersAndSeparators() {
        // Given
        sut.charactersValue = 12
        sut.separatorValue = 3
        let pattern = "^[A-Z_]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        // When
        sut.generatePassword()
        // Then
        XCTAssertEqual(sut.generatedPassword.count, 16)
        XCTAssertTrue(predicate.evaluate(with: sut.generatedPassword))
    }
}
