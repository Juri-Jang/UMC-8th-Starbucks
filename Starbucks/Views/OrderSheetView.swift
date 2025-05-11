//
//  OrderSheetView.swift
//  Starbucks
//
//  Created by 장주리 on 5/6/25.
//

import SwiftUI
import MapKit

struct OrderSheetView: View{
    let segOptions: [String] = ["가까운 매장", "자주 가는 매장"]
    @State private var selectedOption: String = "가까운 매장"
    @ObservedObject var storeViewModel: StoreViewModel
    @State private var isMapViewActive: Bool = false
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var mapViewModel: MapViewModel = .init()
    @State private var isSearchButtonVisible = false
    @State private var shouldMoveToUserLocation = true

    
    var body: some View{
        VStack{
            Spacer().frame(height: 40)
            topBar
            Spacer().frame(height: 24)
            searchBar
            Spacer().frame(height: 22)
            segmentBar
            if isMapViewActive {
                CustomMap(
                        locationManager: locationManager,
                        mapViewModel: mapViewModel,
                        storeViewModel: storeViewModel,
                        shouldMoveToUserLocation: $shouldMoveToUserLocation
                    )
            } else {
                storeList
            }
        }
        .onAppear {
            storeViewModel.loadStores()
        }
    }

    
    private var topBar: some View{
        HStack{
            Spacer()
            Text("매장 설정")
                .font(.mainTextMedium16)
            Spacer()
            Button(action: {
                withAnimation {
                    isMapViewActive.toggle()
                }
            }){
                Image(.mapIcon)
            }
        }
        .frame(width: 375, height: 19)
    }
    
    private var searchBar: some View{
        ZStack{
            Rectangle()
                .fill(Color("gray08"))
                .frame(width: 375, height: 27)
            Button(action:{
                
            }){
                HStack{
                    Spacer().frame(width: 7)
                    Text("검색")
                        .font(.mainTextSemiBold13)
                        .foregroundStyle(Color("gray02"))
                    Spacer()
                }
            }
        }
    }
    
    private var segmentBar: some View{
        VStack{
            HStack{
                ForEach(Array(segOptions.enumerated()), id: \.1){index, option in
                    Button(action: {
                        selectedOption = option
                    }){
                        Text(option)
                            .font(.mainTextSemiBold13)
                            .foregroundStyle(selectedOption == option ? Color("black03") : Color("gray03"))
                    }
                    
                    if(index < segOptions.count - 1 ){
                        Rectangle()
                            .fill(Color("gray03"))
                            .frame(width: 1, height: 19)
                    }
                    
                }
            }
            .frame(width: 375, height: 19, alignment: .leading)
            
            Spacer().frame(height: 17)
            Rectangle()
                .fill(Color("gray07"))
                .frame(width:375, height: 1)
        }
    }
    
    private var storeList: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(storeViewModel.updateFilteredStoresByLocation(), id: \.properties.Seq) { store in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(.store)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 83, height: 83)
                            
                            VStack {
                                Text(store.properties.Sotre_nm)
                                    .font(.mainTextMedium16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer().frame(height: 5)
                                
                                Text(store.properties.Address)
                                    .font(.mainTextSemiBold13)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer().frame(height: 15)

                                HStack {
                                    if store.properties.Category == "리저브 매장" {
                                        Image(.R)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18, alignment: .leading)
                                    }
                                    if store.properties.Category == "DT 매장" {
                                        Image(.D)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18, alignment: .leading)
                                    }
                                    Spacer()
                                    
                                    // 매장 거리 계산
                                    let storeDistance = storeViewModel.calculateDistanceToStore(store: store)
                                    
                                    Text("\(String(format: "%.1f", storeDistance)) km")
                                        .font(.mainTextSemiBold13)
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .padding(.horizontal)
        }
    }
    
    struct SearchButtonView: View {
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text("이 지역 검색")
                    .font(.mainTextMedium16)
                    .padding()
                    .background(Color.green)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
    }
       

}

struct OrderSheetView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheetView(storeViewModel: StoreViewModel())
    }
}
