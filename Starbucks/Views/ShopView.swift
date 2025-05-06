//
//  ShopView.swift
//  Starbucks
//
//  Created by 장주리 on 4/28/25.
//

import SwiftUI

struct ShopView: View{
    let rows = [GridItem(.flexible())]
    private var allProductViewModel = AllProductViewModel()
    private var bestItemViewModel = BestItemViewModel()
    private var newProductsViewModel = NewProductsViewModel()

    var body: some View{
        ZStack{
            Color("white01").ignoresSafeArea()
            ScrollView(.vertical){
                VStack(spacing: 31){
                    topBanner
                    allProductGroup
                    bestItemGroup
                    newProductsGroup
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    //상단 배너
    private var topBanner: some View{
        VStack{
            Text("Starbucks Online Store")
                .font(.mainTextBold24)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 16) {
                    Image(.banner3)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 216)
                    Image(.banner4)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 216)
                    Image(.banner5)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 216)
                   }
               }
               .frame(height: 216)
           }
    }
    
    //All Product
    private var allProductGroup: some View{
        VStack{
            Text("All Products")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows, spacing : 17){
                    ForEach(allProductViewModel.products.indices, id: \.self){index in
                        VStack(spacing: 8) {
                            allProductViewModel.products[index].productImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                            Text(allProductViewModel.products[index].productName)
                                .font(.mainTextRegular13)
                        }
                    }
                }
                .frame(height: 108)
            }
        }
    }
    
    //Best Item
    private var bestItemGroup: some View {
        let bestItems = bestItemViewModel.bestItems
        let pages = (bestItems.count + 3) / 4 // 총 페이지 수

        return VStack {
            Text("Best Item")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
            TabView {
                ForEach(0..<pages, id: \.self) { pageIndex in
                    let startIndex = pageIndex * 4
                    let endIndex = min(startIndex + 4, bestItems.count)
                    let items = Array(bestItems[startIndex..<endIndex])
                    
                    LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 65) {
                        ForEach(items) { item in
                            VStack {
                                item.itemImage
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 157, height: 208,alignment: .leading)
                                
                                Text(item.itemName)
                                    .font(.mainTextSemiBold14)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(item.itemSize)
                                    .font(.mainTextSemiBold14)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                        }
                    }
                }
            }
            .frame(width: 375, height: 490)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))  // 페이지 컨트롤 보이게 설정
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))  // 페이지 컨트롤 배경 표시
        }
    }
    
    //New Products
    private var newProductsGroup: some View{
        VStack{
            Text("New Products")
                .font(.mainTextSemiBold18)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20){
                ForEach(newProductsViewModel.newProducts.indices, id: \.self){index in
                    VStack{
                        newProductsViewModel.newProducts[index].productImage
                            .resizable()
                            .scaledToFit()
                        Text(newProductsViewModel.newProducts[index].productName)
                            .font(.mainTextSemiBold14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(newProductsViewModel.newProducts[index].size)
                            .font(.mainTextSemiBold14)
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    .frame(width: 157, height: 208,alignment: .leading)
                }
            }
        }
    }
    
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
