//
//  SignupView.swift
//  Starbucks
//
//  Created by 장주리 on 3/29/25.
//

import SwiftUI

public struct SignupView: View{
    @StateObject private var signupViewModel = SignupViewModel()
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
            case nickname
            case email
            case password
        }
    
    public var body: some View{
        VStack{
            Spacer()
            signupGroup
            Spacer().frame(height: 328)
            signupButton
            Spacer().frame(height: 72)
        }
        .padding(.horizontal, 19)
    }
    
    private var signupGroup: some View{
        VStack{
            TextField("닉네임", text: $signupViewModel.nickname)
                .padding(.bottom, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 1) // 밑줄 높이
                        .foregroundStyle(focusedField == .nickname ? Color("green01"): Color("gray02")),// 밑줄 색상 변경
                    alignment: .bottom
                )
            
            Spacer().frame(height: 49)
            
            TextField("이메일", text: $signupViewModel.email)
                .padding(.bottom, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 1) // 밑줄 높이
                        .foregroundStyle(focusedField == .email ? Color("green01"): Color("gray02")),// 밑줄 색상 변경
                    alignment: .bottom
                )
            
            Spacer().frame(height: 49)
            
            SecureField("비밀번호", text: $signupViewModel.password)
                .padding(.bottom, 10)
                .overlay(
                    Rectangle()
                        .frame(height: 1) // 밑줄 높이
                        .foregroundStyle(focusedField == .password ? Color("green01"): Color("gray02")),// 밑줄 색상 변경
                    alignment: .bottom
                )
        }
    }
    
    private var signupButton: some View{
        ZStack{
            Button(action: {
                signupViewModel.saveUserData()
                print("생성")
            }){
                ZStack {
                    Text("생성하기")
                        .font(.mainTextMedium16)
                        .foregroundColor(.white)
                        .frame(height:46)
                        .frame(maxWidth: .infinity)
                        .background(Color("green01"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}

struct SignupView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]

    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            SignupView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
