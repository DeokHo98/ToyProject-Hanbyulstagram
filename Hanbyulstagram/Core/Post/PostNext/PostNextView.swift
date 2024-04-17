//
//  PostNextView.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import SwiftUI

struct PostNextView: View {
    
    private var postImage: UIImage?
    @State private var postText: String = ""

    init(postImage: UIImage?) {
        self.postImage = postImage
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                if let postImage {
                    Image(uiImage: postImage)
                        .resizable()
                        .frame(width: 200, height: 280)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.top, 20)

                    TextEditor(text: $postText)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .scrollContentBackground(.hidden)
                        .background(Color(uiColor: .systemGray6))
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(height: 100)
                        .overlay(alignment: .topLeading) {
                            Text("문구를 입력하세요..")
                                .foregroundStyle(postText.isEmpty ? .gray :  .clear)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .padding(.leading, 8)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)

                    Button("공유") {

                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 42)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)

                    Spacer()
                }
            }
        }
        .modifier(DefaultNavigation(title: "새 게시물"))
        .modifier(BackButton())

    }
}

#Preview {
    PostNextView(postImage: UIImage(named: "피드이미지2"))
}
