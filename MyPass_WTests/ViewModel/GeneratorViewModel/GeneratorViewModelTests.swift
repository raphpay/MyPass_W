//
//  GeneratorViewModelTests.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest
import SwiftUI
@testable import MyPass_W

class GeneratorViewModelTests: XCTestCase {
    var sut: GeneratorViewViewModel!
    
    override func setUp() {
        super.setUp()
        // Set up code here
        sut = GeneratorViewViewModel()
    }
    
    override func tearDown() {
        // Tear down code here
        sut = nil
        super.tearDown()
    }
}
