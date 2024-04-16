//
//  ProfileGridView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI

struct ProfileGridView: View {

    // MARK: - Properties

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(0...51, id: \.self) { _ in
                Image("naverLogo")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

#Preview {
    ProfileGridView()
}
