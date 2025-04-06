//
//  DessertMenuViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import Foundation
import SwiftUI

struct DessertMenuViewModel {
    let dessertItems: [DessertMenuModel] = [
        DessertMenuModel(desserImage: Image(.nuttyCroissant), dessertName: "너티크루아상"),
        DessertMenuModel(desserImage:Image(.spicySausageBulgogi), dessertName: "매콤 소시지 불고기"),
        DessertMenuModel(desserImage:Image(.miniLeafPie), dessertName: "미니 리프 파이"),
        DessertMenuModel(desserImage:Image(.painauChocolat), dessertName: "뺑 오 쇼콜라"),
        DessertMenuModel(desserImage:Image(.sausageOlivePie), dessertName: "소시지&올리브 파이")
    ]
}
