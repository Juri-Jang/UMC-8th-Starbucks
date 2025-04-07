import SwiftUI

@main
struct StarbucksApp: App {
    @AppStorage("isLogin") private var isLoginSuccess = false
    
    var body: some Scene {
        WindowGroup {
            if isLoginSuccess {
                CustomTabView()
            } else {
                LoginView()
            }
        }
    }
}
