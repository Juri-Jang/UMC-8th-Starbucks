//
//  EReciptViewModel.swift
//  Starbucks
//
//  Created by 장주리 on 5/2/25.
//

import SwiftUI

class EReceiptViewModel: ObservableObject {
    @Published var selectedImage: UIImage?  // 사용자가 선택한 이미지
    @Published var isShowingPicker: Bool = false  // 사진 선택기 표시 여부
    @Published var isShowingActionSheet: Bool = false  // 액션 시트 표시 여부
}
