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
            ForEach(0...50, id: \.self) { index in
                Image("naverLogo")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}


struct ProfileGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileGridView()
    }
}
