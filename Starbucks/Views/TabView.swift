//
//  TabView.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

struct CustomTabView: View {
        @State var selectedTab : Int = 0
        @Binding var isLoginSuccess: Bool
        
        var body: some View {
            NavigationStack {
                TabView(selection: $selectedTab) {
                    Tab(value: 0, content: { HomeView() }, label: {
                        VStack {
                            Image("home")
                            Text("Home")
                        }
                    })
                    Tab(value: 1, content: { Text("pay") }, label: {
                        VStack {
                            Image("pay")
                            Text("Pay")
                        }
                    })
                    Tab(value: 2, content: { Text("order") }, label: {
                        VStack {
                            Image("order")
                            Text("Order")
                        }
                    })
                    Tab(value: 3, content: { Text("shop") }, label: {
                        VStack {
                            Image("shop")
                            Text("Shop")
                        }
                    })
                    Tab(value: 4, content: { OtherView(isLoginSuccess: $isLoginSuccess) }, label: {
                        VStack {
                            Image("other")
                            Text("Other")
                        }
                    })
                }
                .background(Color("white"))
                .tint(Color("green02"))
                .navigationBarBackButtonHidden(true) // 여기!
            }
        }

    }

    struct CustomTabView_Preview: PreviewProvider {

        static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
        @State static var isLogin = true
        
        static var previews: some View {
            ForEach(devices, id: \.self) { device in
                CustomTabView(isLoginSuccess: $isLogin)
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewDisplayName(device)
            }
        }
    }
