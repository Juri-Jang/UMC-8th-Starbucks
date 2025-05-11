//
//  OrderMenuModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/6/25.
//

import SwiftUI

struct OrderMenuModel: Identifiable {
    let id = UUID()
    let menuImage: Image
    let menuKorName: String
    let menuEngName: String
    let isNew: Bool
    
}
