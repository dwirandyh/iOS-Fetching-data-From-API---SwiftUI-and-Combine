//
//  ImageUrl.swift
//  fechingdataswiftuicombine
//
//  Created by Dwi Randy Herdinanto on 26/02/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import SwiftUI
import Combine

struct ImageRow: View {
    let url : String
    
    var body: some View{
        VStack{
            ImageViewContainer(imageUrl: url)
        }
    }
}

struct ImageViewContainer: View {
    @ObservedObject var remoteUrl: RemoteImageUrl
    
    init(imageUrl: String){
        remoteUrl = RemoteImageUrl(imageURL: imageUrl)
    }
    
    var body: some View{
        GeometryReader{ geo in
            Image(uiImage: UIImage(data: self.remoteUrl.data) ?? UIImage(named: "placeholder")!)
                .resizable()
                .frame(width: geo.size.width)
        }
    }
}

