//
//  ProfileHeaderStatView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI

struct ProfileHeaderStatView: View {

    // MARK: - Properties

    let value: Int
    let title: String

    // MARK: - Body

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
                .fontWeight(.semibold)

            Text(title)
                .font(.subheadline)
        }
        .frame(width: 75)
    }
}
