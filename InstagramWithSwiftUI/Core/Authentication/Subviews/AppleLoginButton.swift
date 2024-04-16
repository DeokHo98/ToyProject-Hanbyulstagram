//
//  AppleLoginButton.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct AppleLoginButton: View {
    var body: some View {
        ZStack {
            Button("Apple로 로그인") {

            }
            .tint(Color(uiColor: .systemBackground))
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

    }
}

#Preview {
    AppleLoginButton()
}
