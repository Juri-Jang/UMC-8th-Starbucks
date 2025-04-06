//
//  HomeViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import Foundation
import SwiftUI

struct RecoMenuViewModel{
    @AppStorage("nickname") var storedNickname: String = ""
    
    let menuItems: [RecoMenuModel] = [
        RecoMenuModel(menuImage: Image(.espConPanna), menuName: "에스프레소 콘파나"),
        RecoMenuModel(menuImage: Image(.espMacchiato), menuName: "에스프레소 마키아또"),
        RecoMenuModel(menuImage: Image(.iceAmericano), menuName: "아이스 카페 아메리카노"),
        RecoMenuModel(menuImage: Image(.hotAmeriano), menuName: "카페 아메리카노"),
        RecoMenuModel(menuImage: Image(.iceMacchiato), menuName: "아이스 카라멜 마끼아또"),
        RecoMenuModel(menuImage: Image(.hotMacchiato), menuName: "카라멜 마끼아또")
    ]
}
