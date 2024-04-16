//
//  TabBarModifier.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct DefaultTabBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color(uiColor: .systemBackground), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
    }
}
