//
//  SetNickNameView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct SetNickNameView: View {

    @State var nickName: String = ""

    var body: some View {
        Text("사용하실 닉네임을 입력해주세요")
            .font(.title3)
            .fontWeight(.bold)
            .padding(.bottom, 5)

        Text("닉네임을 입력하지 않으시고 로그인시 소셜 계정 닉네임으로 설정됩니다.")
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

        Button("사용하기") {

        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .tint(Color(uiColor: .white))
        .frame(width: 360, height: 44)
        .background(Color(uiColor: .systemBlue))
        .clipShape(.rect(cornerRadius: 10))
        .padding(.top, 20)
    }
}

#Preview {
    SetNickNameView()
}
