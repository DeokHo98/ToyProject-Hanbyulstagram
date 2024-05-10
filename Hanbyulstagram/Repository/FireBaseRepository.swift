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

    func setData(collectionKey: FireBaseCollectionKey,
                 documentValue: String,
                 data: [String: Any]) async throws -> Void {
        do {
            try await DB.collection(collectionKey.rawValue).document(documentValue).setData(data)
            return ()
        } catch let error {
            throw error
        }
    }

    func getSnapShot(collectionKey: FireBaseCollectionKey,
                     documentValue: String) async throws -> DocumentSnapshot {
        do {
            return try await DB.collection(collectionKey.rawValue)
                .document(documentValue)
                .getDocument()
        } catch let error {
            throw error
        }
    }
}
