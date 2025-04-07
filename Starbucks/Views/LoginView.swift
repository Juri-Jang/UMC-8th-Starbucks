//
//  LoginView.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI

public struct LoginView: View{
    @StateObject private var LoginviewModel = LoginViewModel()
    @FocusState private var focusedField: Field?
    @AppStorage("isLogin") private var isLoginSuccess = false
    
    enum Field: Hashable {
            case id
            case password
        }

    public var body: some View{
        NavigationStack {
            VStack {
                Spacer().frame(height: 80)
                mainTitleGroup
                Spacer().frame(height: 50)
                middleGroup
                Spacer()
                bottomGroup
                Spacer()
            }
            .padding(.horizontal, 19)
            .navigationDestination(isPresented: $isLoginSuccess) {
                CustomTabView()
            }
        }
    }
    
    
    //상단 그룹
    private var mainTitleGroup: some View{
        VStack(alignment: .leading){
                Image(.starbucks)
                    .resizable()
                    .frame(width: 97, height: 95)
            
                Spacer().frame(height:28)
            
                Text("안녕하세요.\n스타벅스입니다.")
                    .font(.mainTextExtraBold24)
            
                Spacer().frame(height:19)
            
                Text("회원 서비스 이용을 위해 로그인 해주세요.")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color("gray01"))
        }.frame(maxWidth: .infinity, alignment: .leading)
            
    }
    
    //중간 그룹
    private var middleGroup: some View{
        VStack{
            Text("아이디")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color("gray05"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            TextField("", text: $LoginviewModel.email )
                .focused($focusedField, equals: .id)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(focusedField == .id ? Color("green01"): Color("gray00"))
                        .padding(.top, 10), 
                    alignment: .bottom
                )

            Spacer().frame(height:40)
                
            Text("비밀번호")
                .font(.mainTextRegular13)
                .foregroundStyle(Color("gray05"))
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField("", text: $LoginviewModel.password)
                .focused($focusedField, equals: .password)
                .overlay(
                    Rectangle()
                        .frame(height: 1) // 밑줄 높이
                        .foregroundStyle(focusedField == .password ? Color("green01"): Color("gray00")),
                    alignment: .bottom
                )
            
            
            
                Spacer().frame(height:47)
                
            ZStack {
                Button(action: {
                    print("로그인 시도")
                    if LoginviewModel.loginSuccess() {
                        isLoginSuccess = true
                        print("로그인 성공")
                    } else {
                        print("로그인 실패")
                    }
                }) {
                    Text("로그인 하기")
                        .font(.mainTextMedium16)
                        .foregroundColor(.white)
                        .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .background(Color("green01"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
            }

        }
    }
    
    //하단 그룹
    private var bottomGroup: some View{
        VStack{
            NavigationLink(destination: SignupView()){
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color("gray04"))
                    .underline()
            }

            Spacer().frame(height: 19)
                
            Image(.kakaoLogin)
                
            Spacer().frame(height: 19)
                
            Image(.appleLogin)
                   
        }
    }
}


struct LoginView_Preview: PreviewProvider {

    static var devices = ["iPhone 11", "iPhone 16 Pro Max"]
        
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            LoginView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
