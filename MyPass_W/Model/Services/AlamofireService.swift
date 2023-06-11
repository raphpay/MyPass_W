//
//  AlamofireService.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 11/06/2023.
//

import Foundation
import Alamofire

class AlamofireService {
    
    public static let shared = AlamofireService()
    
    private init() {
        // L'initialisation est privé pour être sur qu'une seule instance sera créé
    }
    
    func fetchWebsiteIcon(for domain: String, completion: @escaping (Data?) -> Void) {
        let urlString = "https://www.google.com/s2/favicons?domain=\(domain)&sz=64"
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
