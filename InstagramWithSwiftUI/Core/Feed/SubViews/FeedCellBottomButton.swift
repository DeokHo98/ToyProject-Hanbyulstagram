//
//  FeedCellBottomButton.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedBottomButton: View {
    let imageName: String

    var body: some View {
        Button {

        } label: {
            Image(systemName: imageName)
                .imageScale(.large)
        }
    }
}

#Preview {
    FeedBottomButton(imageName: "heart")
}
