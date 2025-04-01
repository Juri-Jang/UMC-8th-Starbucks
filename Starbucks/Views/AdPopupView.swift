//
//  AdPopupView.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

struct AdPopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Image(.banner)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 720) 
            
            Spacer().frame(height: 106)
            
            //자세히보기 버튼
            Button(action: {
                print("자세히 보기")
            }, label: {
                ZStack{
                    Text("자세히 보기")
                        .foregroundStyle(Color.white)
                        .font(.makeMedium18)
                        .frame(maxWidth: 402, maxHeight: 58)
                        .background(Color("green01"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                })
                .padding(.horizontal, 18)
           
                
            Spacer().frame(height: 19)
                
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Text("X 닫기")
                        .font(.mainTextLight14)
                        .foregroundStyle(Color("gray05"))
                    }
                )}
                .padding(.bottom, 36)
                .padding(.trailing, 37)
            
        }
    }
}

struct AdPopupView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            AdPopupView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
