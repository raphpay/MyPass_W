//
//  AlamofireService.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 11/06/2023.
//

import Foundation
import Alamofire

protocol AlamofireServiceDelegate {
    func fetchWebsiteIcon(for domain: String, completion: @escaping (Data?) -> Void)
}


class AlamofireService: AlamofireServiceDelegate {
    
    static let shared = AlamofireService()
    
    private init() {}
    
    func fetchWebsiteIcon(for domain: String, completion: @escaping (Data?) -> Void) {
        let urlString = "https://www.google.com/s2/favicons?domain=\(domain)&sz=128"
        var imageData: Data?
        
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                imageData = data
            case .failure(let error):
                print("Failed to fetch favicon: \(error.localizedDescription)")
            }
            
            completion(imageData)
        }
    }
}

class WebsiteIconDownloader {
    let alamofireService: AlamofireServiceDelegate

    init(alamofireService: AlamofireServiceDelegate = AlamofireService.shared) {
        self.alamofireService = alamofireService
    }

    func downloadWebsiteIcon(for domain: String, completion: @escaping (Data?) -> Void) {
        alamofireService.fetchWebsiteIcon(for: domain, completion: completion)
    }
}

