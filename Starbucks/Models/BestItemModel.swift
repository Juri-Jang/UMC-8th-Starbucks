//
//  BsetItemModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/29/25.
//

import Foundation
import SwiftUI

struct BestItemModel: Identifiable{
    let id = UUID()
    let itemImage: Image
    let itemName: String
    let itemSize: String
}
