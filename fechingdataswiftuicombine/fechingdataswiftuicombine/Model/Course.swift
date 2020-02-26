//
//  Course.swift
//  fechingdataswiftuicombine
//
//  Created by Dwi Randy Herdinanto on 26/02/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import Foundation

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let bannerUrl: String
}
