//
//  SetNickNameView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI
import ComposableArchitecture

struct SetNickNameView: View {
    @Bindable var store: StoreOf<SetNickNameFeature>

    var body: some View {
        ZStack {
            VStack {
                Text("사용하실 닉네임을 입력해주세요")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                Text("닉네임은 프로필 편집을 통해 변경하실수 있습니다.")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.bottom)

                TextField("닉네임", text: $store.nickName.sending(\.editingText))
                     .textInputAutocapitalization(.none)
                     .font(.subheadline)
                     .padding(12)
                     .background(Color(.systemGray6))
                     .clipShape(.rect(cornerRadius: 10))
                     .padding(.horizontal, 24)

                Button {
                    store.send(.signUpButtonTap)
                    UIApplication.endTextEditing()
                } label: {
                    Text("가입하기")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .tint(Color(uiColor: .white))
                        .frame(width: 360, height: 44)
                        .background(store.signUpButtonColor)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.top, 20)
                }
                .disabled(store.signUpButtonDisabled)
            }
            if WindowProperty.shared.isLoading {
                CustomLoadingView()
            }
        }
        .alert($store.scope(state: \.destinationState?.alert, action: \.destinationAction.alert))
        .modifier(BackButton())
    }
}
