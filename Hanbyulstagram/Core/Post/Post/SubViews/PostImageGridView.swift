//
//  PostImageGridView.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import SwiftUI
import Photos

struct PostImageGridView: View {

    // MARK: - Properties

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    private var imageSize: CGFloat {
        return (UIScreen.main.bounds.width / 4) - 1
    }

    @Binding var selectedAsset: PHAsset?
    @State var imageList: [PHAsset] = []

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(imageList, id: \.self) { asset in
                    PHAsyncImage(imageSize: imageSize, asset: asset, selectedAsset: $selectedAsset)
                }
            }
        }
        .onAppear {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { _ in
                Task {
                    fetchPhotoList()
                }
            }
        }
    }

    private func fetchPhotoList() {
        var assets: [PHAsset] = []
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        for index in 0..<fetchResult.count {
            let asset = fetchResult.object(at: index)
            assets.append(asset)
        }
        imageList = assets
    }

}

#Preview {
    @State var selectedAsset: PHAsset? = nil
    return PostImageGridView(selectedAsset: $selectedAsset)
}
