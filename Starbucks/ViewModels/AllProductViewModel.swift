//
//  AllProductViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/28/25.
//

import SwiftUI
import Foundation

struct AllProductViewModel {
    let products: [AllProductModel] = [
        AllProductModel(productImage: Image(.allproducts1), productName: "텀블러"),
        AllProductModel(productImage: Image(.allproducts2), productName: "커피 용품"),
        AllProductModel(productImage: Image(.allproducts3), productName: "선물세트"),
        AllProductModel(productImage: Image(.allproducts4), productName: "보온병"),
        AllProductModel(productImage: Image(.allproducts5), productName: "머그/컵"),
        AllProductModel(productImage: Image(.allproducts6), productName: "라이프스타일"),
    ]
    
}
