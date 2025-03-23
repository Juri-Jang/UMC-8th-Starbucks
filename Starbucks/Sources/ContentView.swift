import SwiftUI

public struct ContentView: View {
    public var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .onAppear {
                // 폰트 체크 하기
                UIFont.familyNames.sorted().forEach { familyName in
                    print("*** \(familyName) ***")
                    UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                        print("\(fontName)")
                    }
                    print("---------------------")
                }
            }
            .padding()
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
