import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@main
struct StarbucksApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    init() {
        KakaoSDK.initSDK(appKey: Config.appKey)
    }

    var body: some Scene {
        
        WindowGroup {
            if authViewModel.isLoginSuccess {
                CustomTabView(isLoginSuccess: $authViewModel.isLoginSuccess, email: authViewModel.userEmail)
            } else {
                LoginView(isLoginSuccess: $authViewModel.isLoginSuccess, userEmail: $authViewModel.userEmail)
            }
        }
    }
}
