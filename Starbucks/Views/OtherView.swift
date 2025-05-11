//
//  OtherView.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

struct OtherView: View{
    @Binding var isLoginSuccess: Bool
    @StateObject private var signupViewModel = SignupViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    navigationBar
                    Group {
                        Spacer().frame(height: 41)
                        TextGoup
                        Spacer().frame(height: 21)
                        MainbuttonGroup
                        Spacer().frame(height: 41)
                        PayGroup
                        Spacer().frame(height: 41)
                        CustomerGroup
                        Spacer().frame(height: 57)
                    }
                }
                .background(Color("white01"))
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    
    private var navigationBar: some View{
        HStack{
            Text("Other")
                .font(.mainTextBold24)
                .padding(.trailing, 23.5)
            Spacer().frame(width: 200)
            Button(action: {
                isLoginSuccess = false
                print("로그인 여부 : \(isLoginSuccess)")
                print("로그아웃")
            }) {
                Image("logout")
                    .padding(.trailing, 16.5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight:60)
        .background(Color(.white))
    }
    
    private var TextGoup: some View{
        VStack{
            HStack{
                Text(signupViewModel.storedNickname != "" ? "\(signupViewModel.storedNickname)" : "(작성한 닉네임) ")
                    .foregroundStyle(Color("green01"))
                    .font(.mainTextSemibold24)
                Text("님")
                    .font(.mainTextSemibold24)
                    .foregroundStyle(Color.black)
            }
            Text("환영합니다! 🙌🏻")
                .font(.mainTextSemibold24)
                .foregroundStyle(Color.black)
        }
        
    }
    
    private var MainbuttonGroup: some View{
        HStack(spacing: 10.5) {
            MainButton(buttonText: "별 히스토리", imageName: "star") { print("별 히스토리")}
            
            NavigationLink(destination: EReciptView()) {
                        MainButton(buttonText: "전자 영수증", imageName: "bill")
                    }
            
            MainButton(buttonText: "나만의 메뉴", imageName: "menu") {print("나만의 메뉴")}
        }
    }
    
    private var PayGroup: some View{
        VStack{
            Text("Pay")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,10)
            Spacer().frame(height: 24)
            Group{
                HStack{
                    CustomerButton(buttonText: "스타벅스 카드 등록", imageName: "card"){print("스타벅스 카드 등록")}
                    Spacer()
                    CustomerButton(buttonText: "카드 교환권 등록",imageName:"card_exchange"){print("카드 교환권 등록")}
                }
                Spacer().frame(height: 32)
                HStack{
                    CustomerButton(buttonText: "쿠폰 등록",imageName:"coupon"){print("쿠폰 등록" )}
                    Spacer()
                    CustomerButton(buttonText: "쿠폰 히스토리",imageName:"coupon_history"){print("쿠폰 등록")}
                }
            }
            .padding(.horizontal, 11)
            Divider()
                .padding(.leading, 10)
                .padding(.trailing, 102)
        }
    }
    
    private var CustomerGroup: some View {
        VStack {
            Text("고객지원")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            Spacer().frame(height: 24)
            
            HStack {
                CustomerButton(buttonText: "스토어 케어", imageName: "store_care") {
                    print("스토어 케어")
                }
                Spacer()
                CustomerButton(buttonText: "고객의 소리", imageName: "customer") {
                    print("고객의 소리")
                }
            }
            
            Spacer().frame(height: 32)
            
            HStack {
                NavigationLink(destination: SearchStoreView(storeViewModel: StoreViewModel())) {
                    CustomerButton(buttonText: "매장 정보", imageName: "store_info"){print("매장정보")}
                }
                Spacer()
                CustomerButton(buttonText: "반납기 정보", imageName: "return_info") {
                    print("반납기 정보")
                }
            }
            
            Spacer().frame(height: 32)
            
            HStack {
                CustomerButton(buttonText: "마이 스타벅스 리뷰", imageName: "my_review") {
                    print("마이 스타벅스 리뷰")
                }
                Spacer()
            }
        }
        .padding(.horizontal, 11)
    }
}

struct OtherView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    @State static var isLogin = true
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            OtherView(isLoginSuccess: $isLogin)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
