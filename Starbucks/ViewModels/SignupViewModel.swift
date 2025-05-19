//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 3/29/25.
//

import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let keychain = KeychainService.shared


    // 사용자 정보 저장
    func saveUserData() {
        keychain.savePasswordToKeychain(account: KeyChainKey.nickname, service: KeyChainKey.service, password: nickname)
        keychain.savePasswordToKeychain(account: KeyChainKey.email, service: KeyChainKey.service, password: email)
        keychain.savePasswordToKeychain(account: KeyChainKey.password, service: KeyChainKey.service, password: password)
        print("사용자 정보 키체인 저장 완료")
    }

    // 사용자 정보 불러오기
    func loadUserData() {
        nickname = keychain.load(account: KeyChainKey.nickname, service: KeyChainKey.service) ?? ""
        email = keychain.load(account: KeyChainKey.email, service: KeyChainKey.service) ?? ""
        password = keychain.load(account: KeyChainKey.password, service: KeyChainKey.service) ?? ""
    }

    // 사용자 정보 삭제
    func deleteUserData() {
        keychain.delete(account: KeyChainKey.nickname, service: KeyChainKey.service)
        keychain.delete(account: KeyChainKey.email, service: KeyChainKey.service)
        keychain.delete(account: KeyChainKey.password, service: KeyChainKey.service)
        print("사용자 정보 키체인 삭제 완료")
    }
}
