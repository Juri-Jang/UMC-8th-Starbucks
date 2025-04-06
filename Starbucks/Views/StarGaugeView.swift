//
//  StarGaugeView.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import SwiftUI

struct StarGaugeView: View {
    let currentStar: Int
    let maxStar: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // 배경 바
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                
                // 채워지는 바
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("brown02"))
                    .frame(
                        width: geometry.size.width * CGFloat(currentStar) / CGFloat(maxStar)
                    )
                    .animation(.easeInOut, value: currentStar)
            }
        }
    }
}
