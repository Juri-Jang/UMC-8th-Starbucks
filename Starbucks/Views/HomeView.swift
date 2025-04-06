//
//  HomeView.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import SwiftUI

struct HomeView: View{
    @State private var curruntStar: Int = 2
    private var recoViewModel = RecoMenuViewModel()
    private var adViewModel = AdViewModel()
    private var dessertViewModel = DessertMenuViewModel()
    private var detailViewModel = MenuDetailViewModel()
    
    public var body : some View{
        NavigationStack{
            ScrollView(.vertical){
                VStack(spacing: 20){
                    topBanner
                    Image(.banner2)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .padding(.horizontal,10)
                    recommendMenu
                    Image(.eventBanner)
                    Image(.serviceSuscibe)
                    adGroup
                    imageGroup
                    dessertMenu
                    imageBottomGroup
                }
                
                
            }
        }
    }
    
    //상단 배너
    private var topBanner: some View{
        ZStack{
            Image(.topImg)
            VStack(alignment: .leading){
                Spacer().frame(height: 80)
                Text("골든 미모사 그린 티와 함께\n 행복한 새해의 축배를 들어요!")
                    .font(.mainTextBold24)
                Spacer().frame(height: 29)
                VStack{
                    HStack {
                        Text("11★ until next Reward")
                            .font(.mainTextSemibold16)
                            .foregroundStyle(Color("brown02"))

                        Spacer()

                        Button(action: {
                            print("로그인 시도")
                        }) {
                            Text("내용 보기")
                                .font(.mainTextRegular13)
                                .foregroundStyle(Color("gray03"))
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(Color("gray03"))
                        }
                    }
                    .padding(.trailing, 11.16)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    HStack {
                        StarGaugeView(currentStar: curruntStar, maxStar: 12)
                            .frame(width: 255, height: 8)
                        Spacer().frame(width: 36.37)
                        HStack {
                            Text("\(curruntStar)")
                                .foregroundStyle(Color("black03"))
                                .font(.mainTextSemiBold38)
                            Text("/")
                                .foregroundStyle(Color("gray01"))
                                .font(.system(size: 24))
                            Text("12★")
                                .font(.mainTextSemibold24)
                                .foregroundStyle(Color("brown02"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                }
                .padding(.leading, 28.16)
        }
    }
    
    //추천 메뉴
    private var recommendMenu: some View {
        VStack{
            HStack{
                Text(recoViewModel.storedNickname != "" ? "\(recoViewModel.storedNickname)" : "설정 닉네임")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color("brown01"))
                Text("님을 위한 추천 메뉴")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color("black03"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
            Spacer().frame(height: 25)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(recoViewModel.menuItems.indices, id: \.self) { index in
                        NavigationLink(destination: MenuDetailView(menu: detailViewModel.menuDetail[index])) {
                            CircleImageCard(image: recoViewModel.menuItems[index].menuImage,
                                            name: recoViewModel.menuItems[index].menuName)
                        }
                    }
                }
            }
        }
        .padding(.horizontal,20)
    }
    
    //광고 그룹
    private var adGroup: some View{
        VStack{
            Text("What's New")
                .font(.mainTextBold24)
                .foregroundStyle(Color("black03"))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(adViewModel.adList){list in
                        AdCard(image: list.adImage, title: list.title, detail: list.detail)
                    }
                }
            }
        }
        .padding(.leading, 10)
    }
    
    //중간 이미지 그룹
    private var imageGroup: some View{
        VStack(spacing: 14){
            Image(.cupBanner)
            Image(.onlinStudyBanner)
            Image(.deliveryServiceBanner)
        }
    }
    
    //디저트 메뉴
    private var dessertMenu: some View {
        VStack{
            HStack{
                Text("하루가 달콤해지는 디저트")
                    .font(.mainTextBold24)
                    .foregroundStyle(Color("black03"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           
            Spacer().frame(height: 25)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(dessertViewModel.dessertItems){item in
                        CircleImageCard(image: item.desserImage, name: item.dessertName)
                    }
                }
            }
        }
        .padding(.horizontal,20)
    }
    
    //이미지 하단 그룹
    private var imageBottomGroup: some View{
        VStack(spacing: 14){
            Image(.img4)
            Image(.img5)
            Image(.img6)
        }
    }
}


struct HomeView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
        
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            HomeView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}

