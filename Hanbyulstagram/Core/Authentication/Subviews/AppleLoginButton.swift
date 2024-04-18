//
//  AppleLoginButton.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI
import Combine
import FirebaseFirestore

struct AppleLoginButton: View {

    private let appleSignInManager: AppleSignInManagerDependency = AppleSignInManager()

    @Binding var moveSetNickNameView: Bool
    @Binding var model: AppleSignInModel?
    @State private var cancellable: Set<AnyCancellable> = []
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            Text("Apple로 로그인")
                .foregroundStyle(Color(uiColor: .systemBackground))
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 300, height: 44)
                .background(Color(uiColor: .label))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.vertical)
            HStack {
                Image("appleLogo")
                    .frame(height: 44)
                    .padding(.leading, 10)
                Spacer()
            }
            .frame(width: 300, height: 44)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
        .onTapGesture {
            WindowProperty.shared.isLoading = true
            appleSignInManager.startSignIn()
        }
        .onReceive(appleSignInManager.didFailSignIn) { error in
            WindowProperty.shared.isLoading = false
            alertMessage = error.localizedDescription
            showAlert = true
        }
        .onReceive(appleSignInManager.didSuccessSignIn) { model in
            let db = Firestore.firestore()
            db.collection(FireBaseCollectionKey.user.rawValue).document(model.userIdentifier).getDocument { snapShot, error in
                if snapShot?.exists == false || error != nil {
                    self.model = model
                    moveSetNickNameView = true
                } else if snapShot != nil {
                    UserDefaultsManager.isLogin = true
                    UserDefaultsManager.userIdentifier = model.userIdentifier
                    WindowProperty.shared.isLogin = true
                }
                WindowProperty.shared.isLoading = false
            }

        }
    }
}

#Preview {
    @State var moveSetNickNameView: Bool = false
    @State var userModel: AppleSignInModel? = nil
    return AppleLoginButton(moveSetNickNameView: $moveSetNickNameView, model: $userModel)
}
