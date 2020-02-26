//
//  RemoteImageUrl.swift
//  fechingdataswiftuicombine
//
//  Created by Dwi Randy Herdinanto on 26/02/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class RemoteImageUrl: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.data = data
            }

            }.resume()
    }
}
