//
//  AuthViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/18/25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isLoginSuccess = false
    @Published var userEmail = ""
    private let keychain = KeychainService.shared

    init() {
        autoLoginCheck()
    }

    func autoLoginCheck() {
        if let savedEmail = keychain.load(account: KeyChainKey.email, service: KeyChainKey.service),
           !savedEmail.isEmpty {
            userEmail = savedEmail
            isLoginSuccess = true
        }
    }
}

