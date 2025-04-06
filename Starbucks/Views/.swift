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
        HStack {
            if showBackButton {
                Button(action: {
                    onBack?()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.trailing, 4)
                }
            }
            Text(title)
                .font(.mainTextMedium16)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}
