import SwiftUI

@main
struct StarbucksApp: App {
    @State private var isLoginSuccess = false
    
    var body: some Scene {
        WindowGroup {
            if isLoginSuccess {
                CustomTabView(isLoginSuccess: $isLoginSuccess)
            } else {
                LoginView(isLoginSuccess: $isLoginSuccess)
            }
        }
    }
}
