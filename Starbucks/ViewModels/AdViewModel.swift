//
//  AdViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 4/5/25.
//

import Foundation
import SwiftUI

struct AdViewModel {
    let adList: [AdModel] = [
        AdModel(adImage: Image(.img1), title: "25년 3월 일회용컵 없는 날 캠페..", detail: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        AdModel(adImage: Image(.img2), title: "스타벅스 ooo점을 찾습니다", detail: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."),
        AdModel(adImage: Image(.img3), title: "2월 8일, 리저브 스프링 신규 커...", detail: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
    ]
}
