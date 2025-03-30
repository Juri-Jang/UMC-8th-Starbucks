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
    
    @AppStorage("nickname") var storedNickname: String = ""
    @AppStorage("email") var storedEmail: String = ""
    @AppStorage("password") var storedPassword: String = ""
    
    public func saveUserData(){
        storedNickname = nickname
        storedEmail = email
        storedPassword = password
    }
}
