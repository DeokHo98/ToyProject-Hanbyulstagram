//
//  FeedView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedView: View {

    let models: [PostModel] = PostModel.mockModels

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(models, id: \.id) { model in
                        FeedCell(model: model)
                    }
                }
                .padding(.top, 10)
            }
            .modifier(DefaultNavigation(title: "피드"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Hanbyulstagram")
                        .font(.headline)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
