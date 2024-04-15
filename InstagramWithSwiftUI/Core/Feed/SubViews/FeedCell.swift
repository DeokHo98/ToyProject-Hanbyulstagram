//
//  FeedCell.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("Hanbyoul")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)

                Text("정한별")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding(.leading, 10)

            Image("background")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            HStack(spacing: 16) {
                FeedBottomButton(imageName: "heart")
                FeedBottomButton(imageName: "bubble.right")
                FeedBottomButton(imageName: "paperplane")
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)

            Text("좋아요 23개")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            HStack {
                Text("정한별 ")
                    .fontWeight(.semibold) +
                Text("배경화면으로 하면 이쁜 사진입니다.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline)
            .padding(.leading, 10)
            .padding(.top, 1)

            Text("1분 전")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)

        }
    }
}

#Preview {
    FeedCell()
}
