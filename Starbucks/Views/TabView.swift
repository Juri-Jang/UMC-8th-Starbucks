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
            Tab(value:0, content: {Text("home")},label:{
                VStack{
                    Image("home")
                    Text("Home")
                }
            })
            Tab(value:1, content: {Text("pay")},label:{
                VStack{
                    Image("pay")
                    Text("Pay")
                }
            })
            Tab(value:2, content: {Text("order")},label:{
                VStack{
                    Image("order")
                    Text("Oder")
                }
            })
            Tab(value:3, content: {Text("shop")},label:{
                VStack{
                    Image("shop")
                    Text("shop")
                }
            })
            Tab(value:4, content: {OtherView()},label:{
                VStack{
                    Image("other")
                    Text("Other")
                }
            })
        }
        .background(Color("white"))
        .tint(Color("green02"))
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
