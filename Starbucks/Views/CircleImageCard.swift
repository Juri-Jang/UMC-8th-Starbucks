//
//  CircleImageCard.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import SwiftUI

struct CircleImageCard: View{
    let image: Image
    let name: String
    
    var body: some View{
        VStack(spacing: 8){
            image
                .resizable()
                .frame(width: 130, height: 130)
            Text(name)
                .foregroundStyle(Color("black02"))
                .font(.mainTextSemiBold14)
        }
    }
}
