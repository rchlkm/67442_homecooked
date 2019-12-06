//
//  UIImage.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

// ImageView

func imageFromData(_ data:Data) -> UIImage {
    UIImage(data: data) ?? UIImage()
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

  init(urlString: String) {
        imageLoader = ImageLoader(urlString:urlString)
    }

    var body: some View {
        VStack {
            Image(uiImage: imageLoader.data != nil ? UIImage(data:imageLoader.data!)! : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
        }
    }
}
