//
//  AdModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import Foundation
import SwiftUI

struct AdModel: Identifiable {
    let id = UUID()
    let adImage: Image
    let title: String
    let detail: String    
}
