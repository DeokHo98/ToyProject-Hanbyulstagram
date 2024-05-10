//
//  AppleSignInManager.swift
//  LOLInfoApp
//
//  Created by Jeong Deokho on 2024/04/08.
//

import AuthenticationServices

// MARK: - AppleSignInManager

final class AppleSignInManager: NSObject, AppleSignInManagerDependency {
    var continuation: CheckedContinuation<AppleSignInEntity, Error>?

    func startSignIn() async throws -> AppleSignInEntity {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            self?.continuation = continuation
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.performRequests()
        }
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension AppleSignInManager: ASAuthorizationControllerDelegate {
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        didCompletedAuthorization(authorization: authorization)
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        didFailedAuthorization(error: error)
    }
}

