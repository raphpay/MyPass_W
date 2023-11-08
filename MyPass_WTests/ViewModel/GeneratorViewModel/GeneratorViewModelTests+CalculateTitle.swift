//
//  GeneratorViewModelTests+CalculateTitle.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
@testable import MyPass_W

// MARK: - Calculate Title Tests
extension GeneratorViewModelTests {
    func testPasswordStrengthIsWeakThenTitleIsWeakTitle() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.weak.range)
        // When
        let title = sut.calculateTitle()
        // Then
        XCTAssertEqual(title, PasswordStrength.weak.title)
    }
    
    func testPasswordStrengthIsMediocreThenTitleIsMediocreTitle() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.mediocre.range)
        // When
        let title = sut.calculateTitle()
        // Then
        XCTAssertEqual(title, PasswordStrength.mediocre.title)
    }
    
    func testPasswordStrengthIsStrongThenTitleIsStrongTitle() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.strong.range)
        // When
        let title = sut.calculateTitle()
        // Then
        XCTAssertEqual(title, PasswordStrength.strong.title)
    }
    
    func testPasswordStrengthIsVeryStrongThenTitleIsVeryStrongTitle() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.veryStrong.range)
        // When
        let title = sut.calculateTitle()
        // Then
        XCTAssertEqual(title, PasswordStrength.veryStrong.title)
    }
    
    func testPasswordStrengthIsOverLimitThenTitleIsWeakTitle() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.none.range)
        // When
        let title = sut.calculateTitle()
        // Then
        XCTAssertEqual(title, PasswordStrength.none.title)
    }
}
