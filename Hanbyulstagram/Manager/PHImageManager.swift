//
//  PHImageManager.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import Photos
import UIKit

protocol PhotoImageManagerDpendency {
    func fetchImage(asset: PHAsset, targetSize: CGSize) async throws -> UIImage
}

struct PhotoImageManager: PhotoImageManagerDpendency {

    private let imageManager = PHImageManager.default()
    private let requestOptions = PHImageRequestOptions()

    func fetchImage(asset: PHAsset, targetSize: CGSize) async throws -> UIImage {
        requestOptions.isSynchronous = false
        requestOptions.isNetworkAccessAllowed = true
        requestOptions.deliveryMode = .highQualityFormat
        requestOptions.resizeMode = .none

        return try await withCheckedThrowingContinuation { continuation in
            imageManager.requestImage(
                for: asset,
                targetSize: targetSize,
                contentMode: .aspectFill,
                options: requestOptions) { image, error in
                if let error = error as? Error {
                    continuation.resume(throwing: error)
                } else if let image = image {
                    continuation.resume(returning: image)
                } else {
                    // Handle unexpected case where both image and error are nil
                    let unexpectedError = NSError(domain: "com.yourapp.fetchImage", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected error occurred while fetching image"])
                    continuation.resume(throwing: unexpectedError)
                }
            }
        }
    }

}
