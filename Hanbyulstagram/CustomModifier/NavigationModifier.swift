//
//  Navigation-Modifier.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct DefaultNavigation: ViewModifier {

    var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .toolbarBackground(Color(uiColor: .systemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
    }
}
