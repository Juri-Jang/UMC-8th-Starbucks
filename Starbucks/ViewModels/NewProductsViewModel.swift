//
//  NewProductsViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/29/25.
//

import Foundation
import SwiftUI

struct NewProductsViewModel {
    let newProducts: [NewProductsModel] = [
        NewProductsModel(productImage: Image(.newProducts1), productName: "그린 사이렌 도트 머그", size: "237ml"),
        NewProductsModel(productImage: Image(.newProducts2), productName: "그린 사이렌 도트 머그", size: "355ml"),
        NewProductsModel(productImage: Image(.newProducts3), productName: "홈 카페 미니 머그 세트", size: ""),
        NewProductsModel(productImage: Image(.newProducts4), productName: "홈 카페 글라스 세트", size: "")
    ]
}
