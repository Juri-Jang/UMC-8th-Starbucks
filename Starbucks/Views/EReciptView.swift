import SwiftUI
import PhotosUI

struct EReciptView: View {
    @StateObject private var viewModel = ReceiptsViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingActionSheet = false
    @State private var selectedImageForDetail: UIImage? = nil // 상세 보기용 이미지
    @State private var selectedReceipt: EReciptModel? = nil // 선택된 영수증 (상세 보기용)
    @State private var selectedImageForOCR: UIImage? = nil
    @State private var showImageView = false //영수증 화면에 띄울지 여부
    @State private var showPhotosPicker = false // 이미지 뷰 표시 여부
    @State private var showCamera = false // 카메라


    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    navigationBar
                    receiptSummaryView
                        .padding(.horizontal)
                        .padding(.bottom)

                    List(viewModel.receiptList, id: \.id) { receipt in
                        ReceiptRow(receipt: receipt, onReceiptTapped: {
                            if let receiptImageData = receipt.receiptImage,
                               let image = UIImage(data: receiptImageData) {
                                selectedImageForDetail = image // 상세 보기용 이미지 업데이트
                                selectedReceipt = receipt // 상세 보기용 영수증 업데이트
                                showImageView = true
                            }
                        })
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarBackButtonHidden(true)

            // 이미지 추가하는 액션시트
            .confirmationDialog(
                "영수증을 어떻게 추가할까요?",
                isPresented: $isShowingActionSheet,
                titleVisibility: .visible
            ) {
                Button("앨범에서 선택") {
                    showPhotosPicker = true
                }
                Button("카메라로 선택하기") {
                    showCamera = true
                    print("카선")
                }
                Button("취소", role: .cancel) {}
            }
            
            .sheet(isPresented: $showCamera) {
                       CameraPicker { image in
                           viewModel.addImage(image)
                }
            }
            
            // 이미지 피커
            .sheet(isPresented: $showPhotosPicker) {
                ImagePicker(selectedImage: $selectedImageForOCR)
            }

            
            .onChange(of: selectedImageForOCR) {
                if let image = selectedImageForOCR {
                    // 앨범에서 이미지를 선택을 때만 OCR 시작 및 리스트 업데이트
                    viewModel.startOCR(for: image)
                    selectedImageForOCR = nil // OCR 후 초기화
                }
            }

            // 선택된 이미지가 있을 때 전체 화면으로 보여주기
            if showImageView, let selectedImage = selectedImageForDetail {
                ReceiptImageView(showImageView: $showImageView, image: selectedImage)
            }
        }
    }


    //상단바
    private var navigationBar: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding(.leading)
            }
            Spacer()
            Text("전자 영수증")
                .font(.mainTextMedium16)
            Spacer()
            Button(action: {
                isShowingActionSheet = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(Color.white)
    }

    //영수증 정보
    struct ReceiptRow: View {
        let receipt: EReciptModel // 표시할 영수증 데이터를 담는 속성
        let onReceiptTapped: () -> Void // 영수증 항목의 상세 보기를 위한 탭 액션

        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text(receipt.storeName)
                        .font(.mainTextSemiBold18)
                    Text(receipt.date)
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color("gray03"))
                    Text("\(receipt.totalPrice)원")
                        .font(.mainTextSemiBold18)
                        .foregroundStyle(Color("brown02"))
                }
                .padding()

                Spacer()

                Button(action: {
                    onReceiptTapped() // 상세 보기 액션 실행
                }) {
                    Image("reciptBtn")
                }
                .buttonStyle(.plain)
            }
        }
    }

    // 영수증 이미지 뷰
    struct ReceiptImageView: View {
        @Binding var showImageView: Bool
        let image: UIImage

        var body: some View {
            ZStack {
                Color.black.opacity(0.5).ignoresSafeArea()

                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 277 ,height: 786)
                        .padding()

                    VStack{
                        Button(action: {
                            showImageView = false
                        }) {
                            Image("Vector")
                                .resizable()
                                .frame(width:18, height: 18)
                                .foregroundStyle(Color("gray04"))
                                .padding()
                        }
                        .frame(width: 277, height: 786, alignment: .topTrailing)
                    }
                }
                .frame(width: 277, height: 786)
            }
        }
    }

    //영수증 등록 정보
    private var receiptSummaryView: some View {
        HStack {
            Text("총 ")
                .font(.mainTextRegular18)
                .foregroundColor(.black)
            Text("\(viewModel.receiptList.count)건")
                .font(.mainTextSemiBold18)
                .foregroundColor(Color("brown01"))
            Spacer()
            Text("사용 합계 ")
                .font(.mainTextRegular18)
                .foregroundColor(.black)
            Text("\(viewModel.receiptList.reduce(0) { $0 + $1.totalPrice })")
                .font(.mainTextSemiBold18)
                .foregroundColor(Color("brown02"))
        }
        .frame(maxWidth: .infinity)
    }
}

struct EReciptView_Previews: PreviewProvider {
    static var previews: some View {
        EReciptView()
    }
}
