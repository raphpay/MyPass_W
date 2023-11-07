//
//  MockAlamofireService.swift
//  MyPass_WTests
//
//  Created by Raphaël Payet on 07/11/2023.
//

import Foundation
@testable import MyPass_W

class MockAlamofireService: AlamofireServiceDelegate {
    func fetchWebsiteIcon(for domain: String, completion: @escaping (Data?) -> Void) {
        // Create fake data for testing
        guard !domain.isEmpty else {
            completion(nil)
            return
        }
        let fakeImageData = Data("fakeBase64ImageData".utf8)
        
        // Simulate a delay to mimic network latency
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                completion(fakeImageData)
            }
        }
    }
}
