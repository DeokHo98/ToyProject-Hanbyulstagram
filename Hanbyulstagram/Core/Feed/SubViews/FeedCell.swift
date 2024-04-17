//
//  FeedCell.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedCell: View {

    @State private var showMoreText = false {
        didSet {
            lineLimit = true
        }
    }

    @State private var lineLimit = false

    var body: some View {
        VStack {
            HStack {
                Image("한별이")
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


            ZStack(alignment: .bottomTrailing) {
                HStack {
                    let nameText = Text("정한별").fontWeight(.semibold)
                    let postText = Text("모든 텍스트를 배치할 수 있으므로 ContentView높이는 가변적이므로 콘텐츠 주변의 항목이 올바르게 배치되도록 이를 계산해야 합니다. 이 높이 계산이 어떻게 작동하는지 궁금하다면 Majid가 포함된 Swift에 훌륭한 설명이 있습니다 .이제 실제로 뷰를 레이아웃해야 합니다 ZStack. 해당 코드는 다음과 같습니다. 와! 그것을 분석해 봅시다. 먼저 우리는 zStackViews(_:)메소드 호출을 우리의 ZStack및 정의에 추가합니다 zStackViews(_:). 내에서 zStackViews19행의 현재 수평 및 수직 위치를 추적합니다. 그런 다음 함수 ForEach에 의해 생성된 콘텐츠가 포함된 뷰를 반환합니다 forEachView(_:). forEachView단일 ContentText또는 Link보기에 대한 레이아웃을 생성합니다.")

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
