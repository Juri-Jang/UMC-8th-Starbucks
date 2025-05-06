//
//  performOCR.swift
//  Starbucks
//
//  Created by 장주리 on 5/2/25.
//

import Vision
import UIKit

// OCR을 수행하는 함수
func PerformOCR(on image: UIImage, completion: @escaping (String) -> Void) {
    // 이미지에서 CIImage로 변환
    guard let ciImage = CIImage(image: image) else {
        completion("이미지를 CIImage로 변환할 수 없습니다.")
        return
    }

    // 텍스트 인식 요청
    let request = VNRecognizeTextRequest { (request, error) in
        guard let results = request.results as? [VNRecognizedTextObservation], error == nil else {
            completion("OCR 처리 중 오류 발생")
            return
        }

        // 결과에서 텍스트 추출
        var recognizedText = ""
        for observation in results {
            guard let topCandidate = observation.topCandidates(1).first else { continue }
            recognizedText += topCandidate.string + "\n"
        }

        completion(recognizedText)
    }

    // 텍스트 인식 작업 수행
    let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
    try? handler.perform([request])
}

//정보 추출
func extractReceiptDetails(from text: String) -> (storeName: String, date: String, totalPrice: Int)? {
    let storePattern = "스타벅스"  // 예시로 스타벅스 지점
    let datePattern = "\\d{4}-\\d{2}-\\d{2}"  // 날짜 (yyyy-MM-dd)
    let pricePattern = "사용합계\\s*([0-9,]+)"  // 총 가격 (사용합계 뒤에 금액이 나오는 형식)
    
    // 지점 추출
    let storeName = storePattern
    
    // 날짜 추출
    let dateRegex = try? NSRegularExpression(pattern: datePattern, options: [])
    let dateMatches = dateRegex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    let date = dateMatches?.compactMap { match -> String? in
        guard let range = Range(match.range, in: text) else { return nil }
        return String(text[range])
    }.first ?? "날짜 없음"
    
    // 총 가격 추출
    let priceRegex = try? NSRegularExpression(pattern: pricePattern, options: [])
    let priceMatches = priceRegex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    let price = priceMatches?.compactMap { match -> String? in
        guard let range = Range(match.range(at: 1), in: text) else { return nil }
        return String(text[range])
    }.first ?? "0"
    
    // 금액을 숫자로 변환
    let totalPrice = Int(price.replacingOccurrences(of: ",", with: "")) ?? 0
    
    return (storeName, date, totalPrice)
}
