//
//  RemoteImage.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    private static let baseUrl = "https://media.themoviedb.org/t/p/w220_and_h330_face"
    
    func load(fromUrlString urlString: String) {
        let urlString = ImageLoader.baseUrl + urlString
        NetworkManager.shared.downloadImage(fromUrlString:  urlString) { uiImage in
            guard let uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "movieclapper.fill").resizable()
    }
}

struct MDRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
