//
//  StoreViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/6/25.
//

import Foundation
import CoreLocation

class StoreViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var stores: [StoreFeature] = []
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var filteredStores: [StoreFeature]? = nil // 필터링된 매장 리스트
    @Published var isSearchButtonVisible: Bool = false  // "이 지역 검색" 버튼 표시 여부
    @Published var mapCenterCoordinate: CLLocationCoordinate2D?  // 지도 중심 좌표
    
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()  // 위치 권한 요청
        locationManager?.startUpdatingLocation()  // 위치 업데이트 시작
        
        loadStores()
    }
    
    // 매장 데이터 로드
    func loadStores() {
        guard let url = Bundle.main.url(forResource: "starbucks_2025_data", withExtension: "geojson") else {
            print("파일 경로를 찾을 수 없습니다.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let storeData = try JSONDecoder().decode(StoreFeatureCollection.self, from: data)
            self.stores = storeData.features
            self.filteredStores = updateFilteredStoresByLocation()
        } catch {
            print("파일을 읽거나 디코딩하는 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    // CLLocationManager의 delegate 메서드 - 위치 업데이트 시 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location.coordinate
        self.filteredStores = updateFilteredStoresByLocation()   // 위치 업데이트 시 필터링된 매장 갱신
    }
    
    // 거리를 계산하는 메서드 (Double 값 반환)
    func calculateDistanceToStore(store: StoreFeature) -> Double {
        guard let currentLocation = self.currentLocation else { return 0 }
        
        let currentLocationObj = CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        let storeLocation = CLLocation(latitude: store.properties.Ycoordinate, longitude: store.properties.Xcoordinate)
        
        let distanceInMeters = currentLocationObj.distance(from: storeLocation)
        let distanceInKm = distanceInMeters / 1000.0  // 미터 -> 킬로미터 변환
        
        return distanceInKm
    }

    // 10km 이내의 매장만 필터링하고 가까운 순으로 정렬
    func updateFilteredStoresByLocation() -> [StoreFeature] {
        guard let _ = currentLocation else { return [] }
        
        return stores
            .filter { store in
                calculateDistanceToStore(store: store) <= 10  // 10km 이내
            }
            .sorted { store1, store2 in
                let distance1 = calculateDistanceToStore(store: store1)
                let distance2 = calculateDistanceToStore(store: store2)
                return distance1 < distance2  // 가까운 순으로 정렬
            }
    }
    
    // 지도 중심이 변경되었을 때 호출되는 메서드
        func updateMapCenterCoordinate(to coordinate: CLLocationCoordinate2D) {
            self.mapCenterCoordinate = coordinate
            self.isSearchButtonVisible = true  // 드래그 후, 버튼을 활성화
        }
}
