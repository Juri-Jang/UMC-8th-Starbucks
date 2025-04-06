//
//  CustomNavigationBar.swift
//  Starbucks
//
//  Created by 장주리 on 4/4/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    let showBackButton: Bool
    let onBack: (() -> Void)?
    
    var body: some View {
        ZStack {
            // 타이틀 (항상 중앙 정렬)
            Text(title)
                .font(.mainTextMedium16)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            // 뒤로가기 버튼 (왼쪽에 고정)
            HStack {
                if showBackButton {
                    Button(action: {
                        onBack?()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.leading, 8)
                    }
                }
                Spacer() //오른쪽 공간 채움
            }
        }
        .padding()
        .background(Color.white)
    }
}
