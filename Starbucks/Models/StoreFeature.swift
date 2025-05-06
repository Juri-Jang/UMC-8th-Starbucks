//
//  StoreModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/6/25.
//

import Foundation
import CoreLocation

struct StoreFeatureCollection: Codable {
    let features: [StoreFeature]
}

struct StoreFeature: Codable, Identifiable {
    var id = UUID()
    let properties: StoreProperties
    let geometry: StoreGeometry
}

struct StoreProperties: Codable {
    let seq: String
    let storeName: String
    let address: String
    let telephone: String
    let category: String
    let yCoordinate: Double
    let xCoordinate: Double

    enum CodingKeys: String, CodingKey {
        case seq = "Seq"
        case storeName = "Sotre_nm"
        case address = "Address"
        case telephone = "Telephone"
        case category = "Category"
        case yCoordinate = "Ycoordinate"
        case xCoordinate = "Xcoordinate"
    }
}

struct StoreGeometry: Codable {
    let coordinates: [Double]
}
