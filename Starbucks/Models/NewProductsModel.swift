//
//  A.swift
//  Starbucks
//
//  Created by 장주리 on 4/29/25.
//

import Foundation
import SwiftUI

struct NewProductsModel: Identifiable {
    let id = UUID()
    let productImage: Image
    let productName: String
    let size: String
}
