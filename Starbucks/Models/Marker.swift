//
//  MapMarker.swift
//  Starbucks
//
//  Created by 장주리 on 5/11/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
