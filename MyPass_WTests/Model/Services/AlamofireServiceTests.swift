//
//  AlamofireServiceTests.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import XCTest

import XCTest
@testable import MyPass_W

final class AlamofireServiceTests: XCTestCase {
    
    var alamofireService: AlamofireServiceDelegate!
    var websiteDownloader: WebsiteIconDownloader!
    
    override func setUp() {
        super.setUp()
        alamofireService = MockAlamofireService()
        websiteDownloader = WebsiteIconDownloader(alamofireService: alamofireService)
    }

    override func tearDown() {
        alamofireService = nil
        websiteDownloader = nil
        super.tearDown()
    }
    
    func testDownloadCorrectDataFromCorrectWebsite() {
        let domain = "example.com"
        let promise = expectation(description: "Fetch Website Icon Expectation Succeed")
        
        websiteDownloader.downloadWebsiteIcon(for: domain) { data in
            XCTAssertNotNil(data, "Data should not be nil")
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
    }
    
    func testDownloadIncorrectDataFromIncorrectWebsite() {
        let domain = ""
        let promise = expectation(description: "Fetch Website Icon Expectation Fails")
        
        websiteDownloader.downloadWebsiteIcon(for: domain) { data in
            XCTAssertNil(data, "Domain is empty, so is the data")
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 1)
    }
}
