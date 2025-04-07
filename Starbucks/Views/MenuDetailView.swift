//
//  MenuDetailView.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedOption: CoffeeOption?
    let menu: MenuDetailModel

    init(menu: MenuDetailModel) {
        self.menu = menu
        _selectedOption = State(initialValue: menu.defaultOption) 
    }

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .top) {
                    // 메뉴 이미지
                    menu.menuImage
                        //.ignoresSafeArea(edges: .top)

                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(.backIcon)
                        }
                        Spacer()
                        Button(action: {
                            // 공유 버튼 액션
                        }) {
                            Image(.shareIcon)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 18)
                    .padding(.top, 50)
                }

                Spacer().frame(height: 20)

                // 메뉴명
                HStack {
                    Text(menu.menuKorName)
                        .font(.mainTextSemibold24)
                        .foregroundStyle(Color("black03"))
                    Spacer().frame(width: 7)
                    Image(.new)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)

                Spacer().frame(height: 4)

                // 영문 메뉴명
                Text(menu.menuEngName)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color("gray01"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)

                Spacer().frame(height: 32)

                // 메뉴 설명
                Text(menu.menuDescription)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color("gray06"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 10)

                Spacer().frame(height: 20)

                // 가격
                Text(menu.price)
                    .font(.mainTextBold24)
                    .foregroundStyle(Color("black03"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                
                Spacer().frame(height: 32)

                //옵션 토글
                CoffeeOptionButton(options: menu.option.availableOptions, selectedOption: $selectedOption)
                    .padding(.horizontal, 10)

                Spacer()
                
                //주문하기 버튼
                OrderButton()
                    .padding(.bottom, 30)
                    .padding(.horizontal, 28)
                    .frame(alignment: .bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    //옵션 선택 버튼
    struct CoffeeOptionButton: View {
        let options: [CoffeeOption]
        @Binding var selectedOption: CoffeeOption?

        var body: some View {
            if options.count == 1 {
                Text(options.first?.rawValue ?? "")
                    .font(.mainTextSemiBold14)
                    .foregroundColor(options.first?.textColor ?? .black)
                    .frame(height: 36)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.vertical, 10)

            } else {
                ZStack(alignment: selectedOption == .some(.hot) ? .leading : .trailing) {
                    //회색 바
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color("gray07"))
                        .frame(width: .infinity,height: 44)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)

                    HStack {
                        Text("HOT")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray)
                        Text("ICED")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.gray)
                    }
                    .font(.mainTextMedium16)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 44)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                        .overlay(
                            Text(selectedOption?.rawValue ?? "")
                                .font(.mainTextMedium16)
                                .foregroundColor(selectedOption?.textColor ?? .black)
                        )
                        .padding(4)
                        .animation(.easeInOut(duration: 0.25), value: selectedOption)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation {
                        selectedOption = (selectedOption == .hot) ? .iced : .hot
                    }
                }
                .padding(.vertical, 10)
            }
        }
    }

    //주문하기 버튼
    struct OrderButton: View {
        var body: some View {
            Button(action: {
                print("주문하기")
            }) {
                Text("주문 하기")
                    .font(.mainTextMedium16)
                    .foregroundColor(.white)
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .background(Color("green01"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}



#Preview {
    MenuDetailView(menu: MenuDetailModel(menuImage: Image(.espConPanna1), menuKorName: "에스프레소 콘 파나", menuEngName: "Espresso Con Panna", menuDescription: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: "4,100원", option: .iced))
}
