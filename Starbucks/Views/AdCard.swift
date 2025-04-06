//
//  AdCard.swift
//  Starbucks
//
//  Created by 장주리 on 4/6/25.
//

import SwiftUI

struct AdCard: View {
    let image: Image
    let title: String
    let detail: String
    
    var body: some View{
        VStack{
            image
                .resizable()
                .frame(width: 242, height: 160)
            Spacer().frame(height: 16)
            Text(title)
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color("black02"))
                .frame(width: 235, height: 28)
            Spacer().frame(height: 9)
            Text(detail)
                .font(.mainTextSemiBold13)
                .foregroundStyle(Color("gray03"))
                .frame(width: 235, height: 36, alignment: .leading)
        }
    }
}
