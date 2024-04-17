//
//  PHAsyncImage.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import SwiftUI
import Photos

struct PHAsyncImage: View {

    private let photoImageManager = PhotoImageManager()

    let imageSize: CGFloat

    @State var asset: PHAsset?
    @State var image: UIImage?
    @Binding var selectedAsset: PHAsset?

    var body: some View {
        if let image = image {
            ZStack {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .onTapGesture {
                        selectedAsset = asset
                    }
                if selectedAsset == asset {
                    Rectangle()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundStyle(Color(UIColor.label.withAlphaComponent(0.5)))
                }
            }
        } else {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: imageSize, height: imageSize)
                .onAppear {
                    Task {
                        guard let asset else { return }
                        image = try? await photoImageManager.fetchImage(
                            asset: asset,
                            targetSize: CGSize(width: imageSize, height: imageSize)
                        )
                    }
                }
        }
    }
}

#Preview {
    @State var selectedAsset: PHAsset? = nil
    return PHAsyncImage(imageSize: 1, asset: .init(), image: nil, selectedAsset: $selectedAsset)
}
