//
//  FeedCell.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedCell: View {

    let model: PostModel

    @State private var showMoreText = false {
        didSet {
            lineLimit = true
        }
    }

    @State private var lineLimit = false

    var body: some View {
        VStack {
            HStack {
                Image(model.userImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(.circle)

                Text(model.userName)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding(.leading, 10)

            Image(model.feedImageUrl)
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

            Text("좋아요 \(model.likesCount)개")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            ZStack(alignment: .bottomTrailing) {
                HStack {
                    let nameText = Text(model.userName).fontWeight(.semibold)
                    let postText = Text(model.caption)

                    (nameText + Text(" ") + postText)
                    .lineLimit(lineLimit ? 2 : nil)
                    .background(GeometryReader { geometry in
                        //줄높이 계산
                        if showMoreText == false {
                            Color.clear.onAppear {
                                let totalHeight = geometry.size.height // 전체 텍스트의 높이
                                let lineHeight = UIFont.preferredFont(forTextStyle: .body).lineHeight // 한 줄의 높이
                                let approximateLines = Int(totalHeight / lineHeight) + 1 // 대략적인 줄 수 계산
                                showMoreText = approximateLines > 2
                            }
                        }
                    })
                    .overlay(alignment: .trailingLastTextBaseline) {
                             if showMoreText && lineLimit {
                                 Text("..더보기")
                                     .font(.subheadline)
                                     .fontWeight(.semibold)
                                     .foregroundStyle(.gray)
                                     .padding(.leading, 20)
                                     .background {
                                         LinearGradient(
                                             colors: [.clear, Color(UIColor.systemBackground)],
                                             startPoint: .leading,
                                             endPoint: UnitPoint(x: 0.15, y: 0.5)
                                         )
                                     }
                                     .onTapGesture { lineLimit.toggle() }
                             }
                         }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.subheadline)
            .padding(.leading, 10)
            .padding(.top, 1)


            Text(model.timestamp.timeAgoSinceDate())
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(model: PostModel.mockModels.first!)
}
