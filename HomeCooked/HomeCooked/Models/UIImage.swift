//
//  UIImage.swift
//  HomeCooked
//
//  Created by Rachel Kim on 12/6/19.
//  Copyright © 2019 67442. All rights reserved.
//

import Foundation
import SwiftUI

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
