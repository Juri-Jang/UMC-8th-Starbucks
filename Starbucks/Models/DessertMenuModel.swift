//
//  DesserMenuModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import Foundation
import SwiftUI

struct DessertMenuModel: Identifiable {
    let id = UUID()
    let desserImage: Image
    let dessertName: String
}
