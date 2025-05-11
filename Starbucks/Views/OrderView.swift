//
//  OrderView.swift
//  Starbucks
//
//  Created by 장주리 on 5/5/25.
//

import SwiftUI


struct OrderView: View{
    @Namespace private var animation
    @State private var selectedMenu: OrderViewEnums = .allMenu
    @State private var selectedOption: String?
    @State private var isOrderSheetPresented: Bool = false
    @StateObject private var storeViewModel = StoreViewModel()

    let segOptions : [String] = ["음료", "푸드", "상품"]
    private var orderMenuViewModel =  OrderMenuViewModel()
    
    var body: some View{
        VStack{
            topTitle
            Spacer().frame(height: 20)
            topSegment
            Spacer().frame(height: 24)
            bottomSegment
            coffeeMenu
            Spacer()
            storeChoiceBar
        }
        .sheet(isPresented: $isOrderSheetPresented) {
            OrderSheetView(storeViewModel: storeViewModel)
        }
    }
    
    //상단바
    private var topTitle: some View {
        Text("Order")
            .font(.mainTextBold24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 23)
    }
    
    private var topSegment: some View {
        VStack(spacing: 5) {
            HStack {
                ForEach(OrderViewEnums.allCases, id: \.self) { menu in
                    Button {
                        selectedMenu = menu
                    } label: {
                        HStack(spacing: 4) {
                            if let imageName = menu.imageName {
                                Image(imageName)
                            }
                            Text(menu.rawValue)
                                .font(.mainTextSemibold16)
                                .foregroundColor(selectedMenu == menu ? Color("black01") : menu.textColor)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 13)
            Spacer().frame(height: 13)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 3)
                    .shadow(color: Color("gray04"), radius: 3, x: 0, y: 0)
                
                // 움직이는 막대기
                GeometryReader { geo in
                    let width = geo.size.width / CGFloat(OrderViewEnums.allCases.count)
                    
                    // 선택된 메뉴에 애니메이션과 색상 적용
                    Rectangle()
                        .fill(Color("green01"))
                        .frame(width: width, height: 3)
                        .offset(x: width * CGFloat(selectedMenu.index))
                        .animation(.easeInOut(duration: 0.25), value: selectedMenu) // 애니메이션 추가
                }
                .frame(height: 3)
            }
        }
    }
    
    private var bottomSegment: some View{
        VStack{
            HStack(spacing: 13){
                ForEach(segOptions, id: \.self){option in
                    HStack(spacing:3){
                        Button(){
                            selectedOption = option
                        } label: {
                            Text(option)
                                .font(.mainTextSemibold16)
                                .foregroundStyle(selectedOption == option ? Color("black01") : Color("gray04"))
                        }
                        
                        Image(.new)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 29)
            
            Spacer().frame(height: 24)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)
        }
    }
    
    private var coffeeMenu: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 26) {
                ForEach(orderMenuViewModel.menus.indices, id: \.self) { idx in
                    HStack {
                        orderMenuViewModel.menus[idx].menuImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading) {
                            HStack(spacing:1){
                                Text(orderMenuViewModel.menus[idx].menuKorName)
                                    .font(.mainTextSemibold16)
                                    .foregroundStyle(Color("gray06"))
                                VStack{
                                    orderMenuViewModel.menus[idx].isNew == true ? Image(.dot) : nil
                                    Spacer()
                                }
                            }
                            .frame(maxHeight: 22)
                            Spacer().frame(height: 4)
                            Text(orderMenuViewModel.menus[idx].menuEngName)
                                .font(.mainTextSemiBold13)
                                .foregroundStyle(Color("gray03"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 23)
                }
            }
        }
    }
    
    private var storeChoiceBar: some View{
        ZStack{
            Rectangle()
                .fill(Color("black02"))
                .frame(height: 60)
            VStack{
                HStack{
                    Button(){
                        isOrderSheetPresented = true
                    } label: {
                        Text("주문할 매장을 선택해 주세요")
                            .font(.mainTextSemibold16)
                            .foregroundStyle(Color.white)
                        Spacer()
                        Image(.img0)
                    }
                    
                }
                
                Rectangle()
                    .fill(Color("gray06"))
                    .frame(height: 1)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
