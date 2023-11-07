//
//  GeneratorViewModelTests+CalculateColor.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
import SwiftUI
@testable import MyPass_W

// MARK: - Calculate Color Tests
extension GeneratorViewModelTests {
    func testPasswordStrengthIsWeakThenColorIsWeakColor() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.weak.range)
        // When
        let color = sut.calculateColor()
        // Then
        XCTAssertEqual(color, PasswordStrength.weak.color)
    }
    
    func testPasswordStrengthIsMediocreThenColorIsMediocreColor() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.mediocre.range)
        // When
        let color = sut.calculateColor()
        // Then
        XCTAssertEqual(color, PasswordStrength.mediocre.color)
    }
    
    func testPasswordStrengthIsStrongThenColorIsStrongColor() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.strong.range)
        // When
        let color = sut.calculateColor()
        // Then
        XCTAssertEqual(color, PasswordStrength.strong.color)
    }
    
    func testPasswordStrengthIsVeryStrongThenColorIsVeryStrongColor() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.veryStrong.range)
        // When
        let color = sut.calculateColor()
        // Then
        XCTAssertEqual(color, PasswordStrength.veryStrong.color)
    }
    
    func testPasswordStrengthIsOverLimitThenColorIsWeakColor() {
        // Given
        sut.charactersValue = Double.random(in: PasswordStrength.none.range)
        // When
        let color = sut.calculateColor()
        // Then
        XCTAssertEqual(color, Color.black)
    }
}
