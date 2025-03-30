//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
}
