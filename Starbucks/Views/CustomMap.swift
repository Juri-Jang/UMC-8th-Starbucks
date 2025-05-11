//
//  CustomMap.swift
//  Starbucks
//
//  Created by 장주리 on 5/11/25.
//

import SwiftUI
import MapKit

struct CustomMap: UIViewRepresentable {
    let mapView = MKMapView()

    @Bindable var locationManager: LocationManager
    @Bindable var mapViewModel: MapViewModel
    @ObservedObject var storeViewModel: StoreViewModel
    @Binding var shouldMoveToUserLocation: Bool

    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        mapView.isRotateEnabled = false
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // 마커 초기화
        uiView.removeAnnotations(uiView.annotations)

        // 매장 마커 추가
        let annotations = (storeViewModel.filteredStores ?? []).map { store in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: store.properties.Ycoordinate,
                longitude: store.properties.Xcoordinate
            )
            annotation.title = store.properties.Sotre_nm
            return annotation
        }
        uiView.addAnnotations(annotations)

        // 사용자 위치로 이동
        if shouldMoveToUserLocation,
           let location = locationManager.currentLocation {
            let region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
            uiView.setRegion(region, animated: true)

            DispatchQueue.main.async {
                self.shouldMoveToUserLocation = false
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: CustomMap

        init(_ parent: CustomMap) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // 사용자 위치는 기본 마커 유지
            if annotation is MKUserLocation {
                return nil
            }

            let identifier = "StoreMarker"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.image = UIImage(named: "marker") 
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }
    }
}
