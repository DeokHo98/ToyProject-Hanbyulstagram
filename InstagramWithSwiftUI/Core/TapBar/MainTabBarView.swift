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
            Text("피드")
                .tabItem {
                    Image(systemName: "house")
                }

            Text("친구검색")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

            Text("포스팅")
                .tabItem {
                    Image(systemName: "plus")
                }

            Text("알림")
                .tabItem {
                    Image(systemName: "heart")
                }

            Text("프로필")
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.black)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
