//
//  AuthenticationRepository.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import Foundation

protocol AuthenticationRepositoryDependency: FireBaseRepository {
    func setUserData(model: UserModel) async throws -> Void
}

struct AuthenticationRepository: AuthenticationRepositoryDependency {
    func setUserData(model: UserModel) async throws -> Void {
        return try await setData(collection: .user,
                                 document: model.id,
                                 data: model.toData())
    }
}
