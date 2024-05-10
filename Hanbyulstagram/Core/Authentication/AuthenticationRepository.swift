//
//  AuthenticationRepository.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import Foundation

protocol AuthenticationRepositoryDependency: FireBaseRepository {
    func setUserData(DTO: UserDTO) async throws -> Void
    func invalidUser(identifier: String) async -> Bool
}

struct AuthenticationRepository: AuthenticationRepositoryDependency {
    func setUserData(DTO: UserDTO) async throws -> Void {
        return try await setData(collectionKey: .user,
                                 documentValue: DTO.id,
                                 data: DTO.toData())
    }

    func invalidUser(identifier: String) async -> Bool {
        do {
            let snapShot = try await getSnapShot(collectionKey: .user, documentValue: identifier)
            return snapShot.exists
        } catch {
            return false
        }
    }
}
