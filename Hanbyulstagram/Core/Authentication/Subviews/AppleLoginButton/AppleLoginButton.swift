//
//  AppleLoginButton.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI
import ComposableArchitecture
import FirebaseFirestore

struct AppleLoginButton: View {

    @Bindable var store: StoreOf<AppleLoginFeature>

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
        .alert($store.scope(state: \.destinationState?.alert, action: \.destinationAction.alert))
        .onTapGesture {
            store.send(.loginButtonTap)
        }
    }
}

