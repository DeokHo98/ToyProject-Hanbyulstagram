//
//  LogInView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI
import ComposableArchitecture

struct LogInView: View {

    @Bindable var store: StoreOf<LoginFeature>

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Image("한별이")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(.circle)
                    Text("Hanbyulstagram")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    let appleLoginStore = store.scope(state: \.appleLoginState, action: \.appleLoginAction)
                    AppleLoginButton(store: appleLoginStore)
                    Spacer()
                    Divider().padding()
                }
                if WindowProperty.shared.isLoading {
                    CustomLoadingView()
                }
            }
            .navigationDestination(item: $store.scope(state: \.destinationState?.pushNickNameView, action: \.destinationAction.pushNickNameView)) { store in
                SetNickNameView(store: store)
            }
        }
    }
}

#Preview {
    let store = Store(initialState: LoginFeature.State()) {
        LoginFeature()
    }
    return LogInView(store: store)
}
