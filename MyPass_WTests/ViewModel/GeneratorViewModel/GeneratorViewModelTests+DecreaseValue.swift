//
//  GeneratorViewModelTests+DecreaseValue.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
@testable import MyPass_W

// MARK: - Decrease Characters Value Tests
extension GeneratorViewModelTests {
    // MARK: - Decrease Characters Value Tests
    func testDecreaseCharactersValueSucceed() {
        // Given
        sut.charactersValue = 25
        // When
        sut.decreaseValue(.characters)
        // Then
        XCTAssertEqual(sut.charactersValue, 24, "Characters value successfully decreased")
    }
    
    func testDecreaseCharactersValueFromZeroSucceed() {
        // Given
        sut.charactersValue = 0
        // When
        sut.decreaseValue(.characters)
        // Then
        XCTAssertEqual(sut.charactersValue, 0, "Characters value successfully stayed at zero")
    }
    
    func testDecreaseCharactersValueFromNegativeNumberSucceed() {
        // Given
        sut.charactersValue = -1
        // When
        sut.decreaseValue(.characters)
        // Then
        XCTAssertEqual(sut.charactersValue, 0, "Characters value successfully reset to zero")
    }
    
    func testDecreaseCharactersValueDoesNotChangeSeparatorsValue() {
        // Given
        sut.charactersValue = 12
        sut.separatorValue = 2
        // When
        sut.decreaseValue(.characters)
        // Then
        XCTAssertEqual(sut.separatorValue, 2)
    }
    
    // MARK: - Decrease Separators Value Tests
    func testDecreaseSeparatorsValueSucceed() {
        // Given
        sut.separatorValue = 25
        // When
        sut.decreaseValue(.separators)
        // Then
        XCTAssertEqual(sut.separatorValue, 24, "Separators value successfully decreased")
    }
    
    func testDecreaseSeparatorsValueFromZeroSucceed() {
        // Given
        sut.separatorValue = 0
        // When
        sut.decreaseValue(.separators)
        // Then
        XCTAssertEqual(sut.separatorValue, 0, "Separators value successfully stayed at zero")
    }
    
    func testDecreaseSeparatorsValueFromNegativeNumberSucceed() {
        // Given
        sut.separatorValue = -1
        // When
        sut.decreaseValue(.separators)
        // Then
        XCTAssertEqual(sut.separatorValue, 0, "Separators value successfully reset to zero")
    }
    
    func testDecreaseSeparatorsValueDoesNotChangeCharactersValue() {
        // Given
        sut.charactersValue = 12
        sut.separatorValue = 2
        // When
        sut.decreaseValue(.separators)
        // Then
        XCTAssertEqual(sut.charactersValue, 12)
    }
}
