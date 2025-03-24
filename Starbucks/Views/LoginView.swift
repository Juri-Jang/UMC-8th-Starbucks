//
//  LoginView.swift
//  Starbucks
//
//  Created by 장주리 on 3/23/25.
//

import SwiftUI

public struct LoginView: View{
    public var body: some View{
        VStack{
            Spacer().frame(height: 104)
            
            mainTitleGroup
            
            Spacer()
            
            middleGroup
            
            Spacer()
            
            bottomGroup
            
            Spacer()
        }
        .padding(.horizontal, 19)
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
                
                Divider().foregroundStyle(Color("gray00"))
                Spacer().frame(height:47)
                
                Text("비밀번호")
                    .font(.mainTextRegular13)
                    .foregroundStyle(Color("gray05"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            
                Divider().foregroundStyle(Color("gray00"))
                Spacer().frame(height:47)
                
                ZStack{
                    Button(action: {
                        print("로그인 시도")
                    }){
                        ZStack {
                            Text("로그인 하기")
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
    
    //하단 그룹
    private var bottomGroup: some View{
        VStack{
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundStyle(Color("gray04"))
                    .underline()
                
                Spacer().frame(height: 19)
                
                Image(.kakaoLogin)
                
                Spacer().frame(height: 19)
                
                Image(.appleLogin)
                   
        }
    }
}

//#Preview {
//    LoginView()
//}

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
