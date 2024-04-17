//
//  PostView.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import SwiftUI
import Photos

struct PostView: View {

    private let photoImageManager = PhotoImageManager()
    @State var selectedAsset: PHAsset? = nil
    @State var selectedImage: UIImage? = nil

    var body: some View {
        NavigationStack {
            let imageWidth = UIScreen.main.bounds.size.width - 60
            let imageHeight = (UIScreen.main.bounds.size.height / 2.2)
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
                } else {
                    Rectangle()
                        .frame(width: imageWidth, height: imageHeight)
                        .foregroundStyle(.clear)
                }
                PostImageGridView(selectedAsset: $selectedAsset)
            }
            .modifier(DefaultNavigation(title: "새 게시물"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if let selectedImage {
                        NavigationLink("다음") {
                            PostNextView(postImage: selectedImage)
                        }
                    }
                }
            }
            .onChange(of: selectedAsset) {
                Task {
                    guard let selectedAsset else { return }
                    let fetchImage = try await photoImageManager.fetchImage(
                        asset: selectedAsset,
                        targetSize: PHImageManagerMaximumSize
                    )
                    selectedImage = fetchImage
                }
            }
        }
    }
}

#Preview {
    PostView()
}
