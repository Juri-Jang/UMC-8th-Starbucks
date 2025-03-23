//
//  Font.swift
//  tuist
//
//  Created by 장주리 on 3/21/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case extraBold
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    //mainText
    static func mainText(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var mainTextBold20: Font {
        return .mainText(type: .bold, size: 20)
    }
    
    static var mainTextBold24: Font {
        return .mainText(type: .bold, size: 24)
    }
    
    static var mainTextSemibold24: Font {
        return .mainText(type: .semibold, size: 24)
    }
    
    static var mainTextSemiBold18: Font {
        return .mainText(type: .semibold, size: 18)
    }
    
    static var mainTextSemibold16: Font {
        return .mainText(type: .semibold, size: 16)
    }
    
    static var mainTextSemiBold14: Font {
        return .mainText(type: .semibold, size: 14)
    }
    
    static var mainTextMedium16: Font {
        return .mainText(type: .medium, size: 16)
    }
    
    static var mainTextRegular18: Font {
        return .mainText(type: .regular, size: 18)
    }
    
    static var mainTextRegular13: Font {
        return .mainText(type: .regular, size: 13)
    }
    
    static var mainTextRegular12: Font {
        return .mainText(type: .regular, size: 12)
    }
    
    static var mainTextRegular09: Font {
        return .mainText(type: .regular, size: 9)
    }
    
    static var mainTextLight14: Font {
        return .mainText(type: .light, size: 14)
    }
    
    static var mainTextExtraBold24: Font {
        return .mainText(type: .extraBold, size: 24)
    }
    
    static var mainTextSemiBold38: Font {
        return .mainText(type: .semibold, size: 38)
    }
    
    static var mainTextSemiBold13: Font {
        return .mainText(type: .semibold, size: 13)
    }
    
    //buttonText
    static func buttonText(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static var makeMedium18: Font {
        return .buttonText(type : .medium, size : 18)
    }
}
