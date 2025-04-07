//
//  MenuDetailModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import SwiftUI

struct MenuDetailModel: Identifiable {
    let id = UUID()
    let menuImage: Image
    let menuKorName: String
    let menuEngName: String
    let menuDescription: String
    let price: String
    let option: CoffeeOption
    let defaultOption: CoffeeOption
    
    init(menuImage: Image, menuKorName: String, menuEngName: String, menuDescription: String, price: String, option: CoffeeOption) {
        self.menuImage = menuImage
        self.menuKorName = menuKorName
        self.menuEngName = menuEngName
        self.menuDescription = menuDescription
        self.price = price
        self.option = option
        
        switch option {
        case .hotOnly:
            self.defaultOption = .hotOnly
        case .icedOnly:
            self.defaultOption = .icedOnly
        case .hot:
            self.defaultOption = .hot
        case .iced:
            self.defaultOption = .iced
        }
    }
}

enum CoffeeOption: String {
    case hot = "HOT"
    case iced = "ICED"
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICED ONLY"
    
    // 선택 가능한 옵션 배열
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
    
    var textColor: Color {
        switch self {
        case .hot, .hotOnly:
            return Color("red01")
        case .iced, .icedOnly:
            return Color("blue01")
        }
    }
}



