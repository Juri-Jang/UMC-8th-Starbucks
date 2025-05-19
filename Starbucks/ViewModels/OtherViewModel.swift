//
//  OtherViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 3/30/25.
//

import SwiftUI

class OtherViewModel: ObservableObject {
    @Published var nickname: String = ""

    func getNickname(email: String) {
        let nickname = KeychainService.shared.load(account: KeyChainKey.email, service: KeyChainKey.service) ?? ""
        self.nickname = nickname
    }
}


