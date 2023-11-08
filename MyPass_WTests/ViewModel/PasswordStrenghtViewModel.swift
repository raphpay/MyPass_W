//
//  PasswordStrengthViewModelTests.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
import SwiftUI
@testable import MyPass_W

class PasswordStrengthViewModelTests: XCTestCase {
    var sut: PasswordStrengthViewModel!
    
    override func setUp() {
        super.setUp()
        // Set up code here
        sut = PasswordStrengthViewModel()
    }
    
    override func tearDown() {
        // Tear down code here
        sut = nil
        super.tearDown()
    }
}

extension PasswordStrengthViewModelTests {
    // MARK: - Weak Passwords
    func testCheckPasswordWithWeakLengthAndWithSymbolsAndUppercase() {
        // Given
        sut.password = sut.password.random(length: 2)
        sut.password += "I"
        sut.password += "_"
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.weak)
    }
    
    // MARK: - Mediocre Passwords
    func testCheckPasswordMediocreLengthNoSymbolsthenresultIsWeak() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.mediocre.range)
        sut.password = sut.password.random(length: Int(randomLength))
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.weak)
    }
    
    func testCheckPasswordMediocreLengthWithSymbolsThenResultIsMediocre() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.mediocre.range)
        sut.password = sut.password.random(length: Int(randomLength))
        sut.password += "A"
        sut.password += "_"
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.mediocre)
    }
    
    // MARK: - Strong Passwords
    func testCheckPasswordStrongStrengthLengthWithSymbolsThenResultIsWeak() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.strong.range)
        sut.password = sut.password.random(length: Int(randomLength))
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.weak)
    }
    
    func testCheckPasswordStrongStrengthLengthWithSymbolsThenResultIsStrong() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.strong.range)
        sut.password = sut.password.random(length: Int(randomLength) - 2)
        sut.password += "A"
        sut.password += "_"
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.strong)
    }
    
    // MARK: - Very Strong Passwords
    func testCheckPasswordVeryStrongStrengthLengthWithSymbolsThenResultIsWeak() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.veryStrong.range)
        sut.password = sut.password.random(length: Int(randomLength))
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.weak)
    }
    
    func testCheckPasswordVeryStrongStrengthLengthWithSymbolsThenResultIsVeryStrong() {
        // Given
        let randomLength = Double.random(in: PasswordStrength.veryStrong.range)
        sut.password = sut.password.random(length: Int(randomLength))
        sut.password += "A"
        sut.password += "_"
        // When
        sut.checkPassword()
        // Then
        XCTAssertEqual(sut.passwordStrength, PasswordStrength.veryStrong)
    }
}
