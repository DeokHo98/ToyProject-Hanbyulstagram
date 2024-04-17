//
//  MainTabBarView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .modifier(DefaultTabBar())

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .modifier(DefaultTabBar())

            PostView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .modifier(DefaultTabBar())

            Text("알림")
                .tabItem {
                    Image(systemName: "heart")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .modifier(DefaultTabBar())
        }
        .tint(Color(uiColor: .label))
    }
}

#Preview {
    MainTabBarView()
}
