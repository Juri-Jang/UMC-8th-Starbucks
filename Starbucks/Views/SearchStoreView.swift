//
//  SearchStoreView.swift
//  Starbucks
//
//  Created by 장주리 on 5/11/25.
//

import SwiftUI

struct SearchStoreView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var storeViewModel: StoreViewModel
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var mapViewModel: MapViewModel = .init()
    @State private var shouldMoveToUserLocation = true

    let segOptions: [String] = ["매장 찾기", "길찾기"]
    @State private var selectedIndex: Int = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                topBar
                segmentbar
                CustomMap(
                    locationManager: locationManager,
                    mapViewModel: mapViewModel,
                    storeViewModel: storeViewModel,
                    shouldMoveToUserLocation: $shouldMoveToUserLocation
                    
                )
                .overlay(
                    Button(action: {
                        shouldMoveToUserLocation = true
                    }) {
                        Image(.location)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(Circle().fill(Color.white.opacity(0.7)))
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 50)
                    .padding(.trailing, 20),
                    alignment: .bottomTrailing
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private var topBar: some View {
        CustomNavigationBar(title: "매장 찾기", showBackButton: true) {
            presentationMode.wrappedValue.dismiss()
        }
    }

    private var segmentbar: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                ForEach(Array(segOptions.enumerated()), id: \.offset) { index, option in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedIndex = index
                        }
                    }) {
                        Text(option)
                            .font(.mainTextBold20)
                            .foregroundStyle(selectedIndex == index ? Color("black03") : Color("gray03"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                    }
                }
            }
            .padding(.horizontal, 13)

            GeometryReader { geo in
                let segmentWidth = geo.size.width / CGFloat(segOptions.count)
                let centerOffset = segmentWidth * CGFloat(selectedIndex) + (segmentWidth - 120) / 2

                RoundedRectangle(cornerRadius: 999)
                    .fill(Color("brown02"))
                    .frame(width: 120, height: 5)
                    .offset(x: centerOffset)
                    .animation(.easeInOut(duration: 0.25), value: selectedIndex)
            }
            .frame(height: 5)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    SearchStoreView(storeViewModel: StoreViewModel())
}
