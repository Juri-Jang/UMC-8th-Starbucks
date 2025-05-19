//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
        
    func loginSuccess() -> Bool {
        guard let savedPassword = KeychainService.shared.load(account: KeyChainKey.email, service: KeyChainKey.service) else {
            print("저장된 비밀번호가 없습니다.")
            return false // 저장된 비밀번호가 없음
        }
        return password == savedPassword
    }
    
    func sendTokenToBackend(token: String) {
        let url = "https://your-backend.com/api/login/kakao" //임시
        let parameters: Parameters = ["accessToken": token]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate() //Http 응답 상태 및 Content-Type 검증 (성공시(200~300) .success / 실패시 .failure)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("서버 응답 성공: \(data)")
                    KeychainService.shared.savePasswordToKeychain(account: KeyChainKey.kakaoToken, service: KeyChainKey.service, password: token)
                    
                case .failure(let error):
                    print("서버 응답 실패: \(error)")
                }
            }
    }
    
}
