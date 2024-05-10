//
//  ProfileView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI

struct ProfileView: View {

    let model = UserDTO.mockModels.last!

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack() {
                    ProfileHeaderView(model: model)
                }
                .padding(.top, 5)
                ProfileGridView()
                    .padding(.top, 5)
            }
            .modifier(DefaultNavigation(title: "프로필"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        WindowProperty.shared.isLoggedIn = false
                        UserDefaultsManager.isLogin = false
                        UserDefaultsManager.userIdentifier = ""
                    } label: {
                        Text("로그아웃")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color(uiColor: .label))
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
