//
//  FeedView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/15.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...10, id: \.self) { _ in
                        FeedCell()
                    }
                }
                .padding(.top, 10)
            }
            .modifier(DefaultNavigation(title: "피드"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Instagram")
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
