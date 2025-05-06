//
//  BestItemViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/29/25.
//

import Foundation
import SwiftUI

struct BestItemViewModel {
    let bestItems: [BestItemModel] = [
        BestItemModel(itemImage: Image(.bestItem1), itemName: "그린 사이렌 슬리브 머그", itemSize: "355ml"),
        BestItemModel(itemImage: Image(.bestItem2), itemName: "그린 클래식 슬리브 머그", itemSize: "355ml"),
        BestItemModel(itemImage: Image(.bestItem3), itemName: "사이렌 머그 앤 우드 소서", itemSize: ""),
        BestItemModel(itemImage: Image(.bestItem4), itemName: "리저브 골드 테일 머그 ", itemSize: "355ml"),
        BestItemModel(itemImage: Image(.bestItem5), itemName: "블랙 앤 골드 머그", itemSize: "473ml"),
        BestItemModel(itemImage: Image(.bestItem6), itemName: "블랙 링 머그 ", itemSize: "355ml"),
        BestItemModel(itemImage: Image(.bestItem7), itemName: "북청사자놀음 데미머그", itemSize: "89ml"),
        BestItemModel(itemImage: Image(.bestItem8), itemName: "서울 제주 데미머그 세트", itemSize: "")
    ]

}



