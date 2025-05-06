//
//  EReciptModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/2/25.
//

import Foundation
import SwiftData

@Model
class EReciptModel {
    @Attribute(.unique) var id: UUID
    var storeName: String
    var date: String
    var totalPrice: Int
    var receiptImage: Data? //Data -> 이미지, 오디오 등 이진 데이터 다룰 때 사용 (UIImage -> Data 저장 후 화면에 띄울 때 Data -> UIImage로 변환)
    
    init(storeName: String, date: String, totalPrice: Int, receiptImage: Data? = nil) {
        self.id = UUID()
        self.storeName = storeName
        self.date = date
        self.totalPrice = totalPrice
        self.receiptImage = receiptImage
    }
}
