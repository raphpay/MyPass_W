//
//  GeneratorViewModelTests+CopyPassword.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
@testable import MyPass_W

extension GeneratorViewModelTests {
    func testCopyingTextToClipboardSucceed() {
        // Given
        let testPassword = "password"
        sut.generatedPassword = testPassword
        // When
        sut.copyPassword()
        // Then
        XCTAssertEqual(UIPasteboard.general.string, testPassword)
    }
}
