//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""

    func loginSuccess() -> Bool{
        guard !email.isEmpty, !password.isEmpty else { return false }
        return email == storedEmail && password == storedPassword
    }
}
