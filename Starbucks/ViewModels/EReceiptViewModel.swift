import SwiftUI
import Vision

class ReceiptsViewModel: ObservableObject {
    @Published var receiptList: [EReciptModel] = [] // 영수증 리스트를 관리하는 변수
    var images: [UIImage] = []
    
    func addImage(_ image: UIImage) {
            images.append(image)
            startOCR(for: image)
        }

        func removeImage(at index: Int) {
            guard images.indices.contains(index) else { return }
            images.remove(at: index)
        }

        func getImages() -> [UIImage] {
            images
        }

    // OCR을 실행하는 함수
    func startOCR(for image: UIImage) {
        guard let cgImage = image.cgImage else {
            print("OCR 처리 실패")
            return
        }

        // 이미지 데이터를 Data로 변환
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            print("이미지 데이터 변환 실패")
            return
        }

        // OCR 텍스트 인식 요청
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }

            // 인식된 텍스트를 결합하여 전체 텍스트 생성
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")

            // 텍스트를 파싱하여 영수증 정보 추출
            if let parsedReceipt = self.parseReceiptInfo(from: fullText) {
                // UI 업데이트는 메인 쓰레드에서
                DispatchQueue.main.async {
                    // 이미지 데이터도 함께 저장하여 새 영수증 모델 생성 및 리스트에 추가
                    let newReceipt = parsedReceipt
                    newReceipt.receiptImage = imageData
                    self.receiptList.append(newReceipt)
                }
            }
        }

        // 텍스트 인식 정확도를 높임
        request.recognitionLevel = .accurate
        // 한국어 인식
        request.recognitionLanguages = ["ko-KR"]

        // OCR 처리 요청을 백그라운드에서 수행
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }

    // 영수증 정보에서 필요한 부분(지점, 날짜, 총 금액)만 파싱
    private func parseReceiptInfo(from text: String) -> EReciptModel? {
        let lines = text.components(separatedBy: .newlines)

        var store: String = ""
        var date: String = ""
        var totalAmount: Int = 0

        var i = 0
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(i)] \(trimmed)")

            // 지점 정보 추출
            if store.isEmpty, let storeName = extractStoreName(from: trimmed) {
                store = storeName
                print("지점: \(store)") // 디버깅 출력
            }

            // 결제 금액
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                    print("결제 금액: \(totalAmount)")
                }
            }

            // 날짜 추출 (첫 번째 날짜만 저장)
            if date.isEmpty, let extractedDate = extractDate(from: trimmed) {
                date = extractedDate
                print("날짜 추출: \(date)") // 디버깅 출력
            }

            i += 1
        }

        if !store.isEmpty && !date.isEmpty {
            return EReciptModel(storeName: store, date: date, totalPrice: totalAmount)
        }
        return nil
    }

    // 지점명 추출 함수
    private func extractStoreName(from line: String) -> String? {
        // "점"이 포함된 텍스트에서 지점명을 추출
        if line.contains("점") {
            let storeName = line.split(separator: " ").first { $0.contains("점") }
            return storeName?.description
        }
        return nil
    }

    // 날짜 추출 함수 (공백 유무 모두 허용)
    private func extractDate(from line: String) -> String? {
        let datePatterns = [
            "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}", // 공백 있는 형식
            "\\d{4}-\\d{2}-\\d{2}\\d{2}:\\d{2}:\\d{2}", // 공백 없는 형식
        ]

        for pattern in datePatterns {
            if let match = line.range(of: pattern, options: .regularExpression) {
                return String(line[match])
            }
        }
        return nil
    }
}
