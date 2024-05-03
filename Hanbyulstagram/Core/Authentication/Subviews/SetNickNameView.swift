//
//  SetNickNameView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct SetNickNameView: View {

    var windowProperty = WindowProperty.shared

    @State private var nickName: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Binding var model: AppleSignInModel?

    private let repository: AuthenticationRepositoryDependency = AuthenticationRepository()

    var body: some View {
        Text("사용하실 닉네임을 입력해주세요")
            .font(.title3)
            .fontWeight(.bold)
            .padding(.bottom, 5)

        Text("닉네임은 프로필 편집을 통해 변경하실수 있습니다.")
            .font(.footnote)
            .foregroundStyle(.gray)
            .padding(.bottom)

        TextField("닉네임", text: $nickName)
             .textInputAutocapitalization(.none)
             .font(.subheadline)
             .padding(12)
             .background(Color(.systemGray6))
             .clipShape(.rect(cornerRadius: 10))
             .padding(.horizontal, 24)

        Button {
            windowProperty.isLoading = true
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            login()
        } label: {
            Text("가입하기")
                .font(.subheadline)
                .fontWeight(.semibold)
                .tint(Color(uiColor: .white))
                .frame(width: 360, height: 44)
                .background(nickName == "" ? .gray : Color(uiColor: .systemBlue))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.top, 20)
        }
        .disabled(nickName == "")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
    }

    private func login() {
        let model = UserModel(id: model?.userIdentifier ?? "", userName: nickName)
        Task {
            do {
                try await repository.setUserData(model: model)
                windowProperty.isLoading = false
                windowProperty.isLoggedIn = true

                UserDefaultsManager.userIdentifier = model.id
                UserDefaultsManager.isLogin = true
            } catch let error {
                alertMessage = error.localizedDescription
                windowProperty.isLoading = false
                showAlert = true
            }
        }

    }
}
