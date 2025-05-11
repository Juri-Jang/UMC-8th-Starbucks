//
//  OrderViewEnums.swift
//  Starbucks
//
//  Created by 장주리 on 5/5/25.
//

import SwiftUI

enum OrderViewEnums: String, CaseIterable, Identifiable{
    case allMenu = "전체 메뉴"
    case myMenu = "나만의 메뉴"
    case reservationHallCake = "홀케이크 예약"
    
    var id: String { self.rawValue }
    
    var index: Int {
            return OrderViewEnums.allCases.firstIndex(of: self) ?? 0
        }
    
    var textColor: Color{
        switch self{
        case .reservationHallCake:
            return Color("green01")
        default:
            return Color("gray04")
        }
    }
    
    var imageName:String?{
        switch self{
        case .reservationHallCake:
            return "cake"
        default:
            return nil

        }
    }
}
