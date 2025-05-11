//
//  MapViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/11/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {

    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    private(set) var userChangedLocation: Bool = false

    var annotations: [MKPointAnnotation] = []

    func updateMarkers(for stores: [StoreFeature]) {
        print("🟢 updateMarkers: \(stores.count)개 매장 표시")

        self.annotations = stores.map { store in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: store.properties.Ycoordinate,
                longitude: store.properties.Xcoordinate
            )
            annotation.title = store.properties.Sotre_nm
            return annotation
        }
    }

    func updateFromLocation(_ location: CLLocation?) {
        guard let location else { return }
        cameraPosition = .camera(MapCamera(centerCoordinate: location.coordinate, distance: 500))
    }

    // 사용자가 지도를 드래그하거나 위치를 변경했을 때 호출될 메소드
    func userChangedCameraPosition() {
        userChangedLocation = true
    }

    // 사용자의 현재 위치로 돌아가는 함수
    func moveToUserLocation() {
        guard let location = LocationManager.shared.currentLocation else { return }
        cameraPosition = .camera(MapCamera(centerCoordinate: location.coordinate, distance: 500))
        currentMapCenter = location.coordinate // 현재 위치로 돌아가도록 설정
        userChangedLocation = false
        }
}
