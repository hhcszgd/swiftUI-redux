//
//  URLImageView.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct URLImageView: View {
    let url: String
    @ObservedObject private var imageLoader: ImageLoader = ImageLoader()
    init(url: String) {
        self.url = url
        self.imageLoader.loadImage(url: url)
    }
    
    var body: some View {
        if let imageData = self.imageLoader.loadedData {
//            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: UIImage(data: imageData)!) //Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
            }
        } else {
            return VStack {
                Image(systemName: "person.crop.circle.badge.plus")
            }
        }
    }
}
