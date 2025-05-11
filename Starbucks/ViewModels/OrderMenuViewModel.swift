//
//  MenuDetailViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import Foundation
import SwiftUI

struct OrderMenuViewModel {
    let menus: [OrderMenuModel] = [
        OrderMenuModel(menuImage: Image(.espMacchiato), menuKorName: "추천", menuEngName: "Recommend", isNew: true),
        OrderMenuModel(menuImage: Image(.iceAmericano), menuKorName: "아이스 카페 아메리카노", menuEngName: "Reserve Espresso", isNew: true ),
        OrderMenuModel(menuImage: Image(.hotAmeriano), menuKorName: "카페 아메리카노", menuEngName: "Reserve Drip", isNew: true),
        OrderMenuModel(menuImage: Image(.cappuccino), menuKorName: "카푸치노", menuEngName: "Dcaf Coffee", isNew: false),
        OrderMenuModel(menuImage: Image(.iceCappuccino), menuKorName: "아이스 카푸치노", menuEngName: "Espresso", isNew: true),
        OrderMenuModel(menuImage: Image(.macchiato), menuKorName: "카라멜 마키아또", menuEngName: "Blonde Coffee", isNew: true),
        OrderMenuModel(menuImage: Image(.iceAmericano), menuKorName: "아이스 카라멜 마키아또", menuEngName:"Cold Brew", isNew: false),
        OrderMenuModel(menuImage: Image(.img8), menuKorName: "아포가토/기타", menuEngName: "Others", isNew: false),
        OrderMenuModel(menuImage: Image(.img9), menuKorName: "럼 샷 코르타도", menuEngName: "Brewed Coffee", isNew: true),
        OrderMenuModel(menuImage: Image(.img10), menuKorName: "라벤터 카페 브레베", menuEngName: "Teavana", isNew: true),
        OrderMenuModel(menuImage: Image(.img11), menuKorName: "병음료", menuEngName: "RTD", isNew: false)
    ]
}
