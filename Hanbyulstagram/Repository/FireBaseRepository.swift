//
//  FireBaseRepository.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

protocol FireBaseRepository { }

extension FireBaseRepository {
    var DB: Firestore {
        Firestore.firestore()
    }

    func setData(collection: FireBaseCollectionKey,
                 document: String,
                 data: [String: Any]) async throws -> Void {
        do {
            try await DB.collection(collection.rawValue).document(document).setData(data)
            return ()
        } catch let error {
            throw error
        }
    }
}
