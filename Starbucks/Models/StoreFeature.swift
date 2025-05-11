//
//  StoreModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/6/25.
//

import Foundation

struct StoreFeatureCollection: Codable {
    var type: String
    var name: String
    var features: [StoreFeature]
    
}

struct StoreFeature: Codable, Equatable {
    var type: String
    var properties: StoreProperties
    var geometry: StoreGeometry

    static func == (lhs: StoreFeature, rhs: StoreFeature) -> Bool {
        // Store를 구별할 수 있는 유일한 속성(예: Seq 또는 X/Y좌표 등)을 기준으로 비교
        return lhs.properties.Seq == rhs.properties.Seq
    }
}

struct StoreProperties: Codable {
    var Seq: String
    var Sotre_nm: String
    var Address: String
    var Telephone: String
    var Category: String
    var Ycoordinate: Double
    var Xcoordinate: Double
}

struct StoreGeometry: Codable {
    var type: String
    var coordinates: [Double]
}
