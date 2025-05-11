//
//  AllProductModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/28/25.
//

import Foundation
import SwiftUI

struct AllProductModel : Identifiable{
    let id = UUID()
    let productImage: Image
    let productName: String
}
