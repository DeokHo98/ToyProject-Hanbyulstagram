//
//  AppleSignInDependency.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/09.
//

import AuthenticationServices
import Combine

// MARK: - Dependency

protocol AppleSignInManagerDependency {
    var continuation: CheckedContinuation<AppleSignInEntity, Error>? { get }

    func startSignIn() async throws -> AppleSignInEntity
}

// MARK: - DidComplete Function

extension AppleSignInManagerDependency {

    func didCompletedAuthorization(authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            continuation?.resume(throwing: AppleSignInError.invalidAppleIDCredential)
            return
        }
        guard let authorizationCode = credential.authorizationCode,
              let identityToken = credential.identityToken else {
            continuation?.resume(throwing: AppleSignInError.invalidAuthorizationData)
            return
        }
        let model = getAppleSignInEntity(credential: credential,
                                          authorizationCode: authorizationCode,
                                          identityToken: identityToken)
        continuation?.resume(returning: model)
    }

    func didFailedAuthorization(error: Error) {
        guard let error = error as? ASAuthorizationError else {
            continuation?.resume(throwing: AppleSignInError.errorTypeMismatch(error: error))
            return
        }
        continuation?.resume(throwing: AppleSignInError.mapToAppleSignInError(errorCode: error.code))
    }

    /// 애플로그인에 필요한 Entity를 생성하는 함수입니다.
    func getAppleSignInEntity(
        credential: AppleIDCredentialDependency,
        authorizationCode: Data,
        identityToken: Data
    ) -> AppleSignInEntity {
        let firstName = credential.fullName?.givenName ?? ""
        let lastName = credential.fullName?.familyName ?? ""
        return AppleSignInEntity(
            email: credential.email ?? "",
            name: "\(firstName) \(lastName)",
            userIdentifier: credential.user,
            authorizationCode: authorizationCode,
            identityToken: identityToken
        )
    }
}

// MARK: - ASAuthorizationAppleIDCredential Dependency

// ASAuthorizationAppleIDCredential를 상속받아 Mock객체를 구현하는게 불가능하기때문에 Mock객체구현을 위한 프로토콜 입니다.
protocol AppleIDCredentialDependency {
    var authorizationCode: Data? { get }
    var identityToken: Data? { get }
    var fullName: PersonNameComponents? { get }
    var email: String? { get }
    var user: String { get }
}

extension ASAuthorizationAppleIDCredential: AppleIDCredentialDependency {}
