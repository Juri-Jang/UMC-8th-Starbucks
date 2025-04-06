//
//  MenuDetailModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import Foundation
import SwiftUI

struct MenuDetailModel: Identifiable {
    let id = UUID()
    let menuImage: Image
    let menuKorName: String
    let menuEngName: String
    let menuDescription: String
    let price: String
    let option: CoffeeOption
}

enum CoffeeOption: String {
    case hot = "HOT"
    case iced = "ICED"
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICED ONLY"
    
    var availableOptions: [Self] {
        switch self {
        case .hotOnly:
            return [.hotOnly]
        case .icedOnly:
            return [.icedOnly]
        default:
            return [.hot, .iced]
        }
    }
    
    // 텍스트 색상
    var textColor: Color {
        switch self {
        case .hot, .hotOnly:
            return Color("red01")
        case .iced, .icedOnly:
            return Color("blue01")
        }
    }
}


