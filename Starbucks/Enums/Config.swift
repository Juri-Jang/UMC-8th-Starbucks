//
//  Config.swift
//  Starbucks
//
//  Created by 장주리 on 5/19/25.
//

import Foundation

enum Config{
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let appKey: String = {
        guard let appKey = Config.infoDictionary["KAKAO_NATIVE_APP_KEY"] as? String else{
            fatalError()
        }
        return appKey
    }()
}

