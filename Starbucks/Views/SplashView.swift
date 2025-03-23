//
//  Untitled.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI

public struct SplashView: View{
    public var body: some View{
        ZStack(alignment: .center){
            Color.green.edgesIgnoringSafeArea(.all) //뒷배경 색상
            Image(.starbucks)
        }
    }
}

//#Preview {
//    SplashView()
//}

struct SplashView_Preview: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            SplashView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
