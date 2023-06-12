//
//  CredentialRow.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 10/06/2023.
//

import SwiftUI

struct CredentialRow: View {
    let credential: Credential
    @State var imageData: Data?
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                
                if let imageData = imageData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            
            VStack(alignment: .leading) {
                Text(credential.website)
                Text(credential.username)
            }
            Spacer()
        }
        .onAppear {
            // TODO: Think about a cache, or storing the image data in Realm
            AlamofireService.shared.fetchWebsiteIcon(for: credential.website) { fetchedImageData in
                guard let fetchedImageData = fetchedImageData else {
                    print("No image found for website \(credential.website)")
                    return
                }
                
                self.imageData = fetchedImageData
            }
        }
    }
}

struct CredentialRow_Previews: PreviewProvider {
    static var previews: some View {
        CredentialRow(credential: Credential.sample)
    }
}
