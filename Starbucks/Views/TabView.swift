//
//  TabView.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectedTab : Int = 0
    
    var body: some View{
        TabView(selection: $selectedTab){
            Tab("Home", systemImage: "house.fill", value: 0) {}
            Tab("Pay", systemImage: "wallet.bifold", value: 1) {}
            Tab("Order", systemImage: "cup.and.saucer", value: 2) {}
            Tab("Shop", systemImage: "handbag.fill", value: 3) {}
            Tab("Other", systemImage: "ellipsis", value: 4) {
                OtherView()
            }
        }
        .tint(Color("green02"))
        .background(Color("white"))
    }
}

struct CustomTabView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            CustomTabView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
