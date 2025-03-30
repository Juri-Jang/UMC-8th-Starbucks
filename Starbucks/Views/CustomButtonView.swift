//
//  CustomButtonView.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

struct MainButton: View {
    var buttonText: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(buttonText)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color("black03"))
            }
            .padding(.vertical, 19)
            .frame(width: 102, height: 108)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.10), radius: 5, x: 0, y: 0) 
            )
        }
        
    }
}

struct CustomerButton: View{
    var buttonText: String
    var imageName: String
    var action: () -> Void
    
    var body: some View{
        Button(action: action){
            HStack(spacing: 4){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(buttonText)
                    .font(.mainTextSemibold16)
                    .foregroundStyle(Color("black02"))
            }
        }
        .frame(width: 157, alignment: .leading)
    }
}
