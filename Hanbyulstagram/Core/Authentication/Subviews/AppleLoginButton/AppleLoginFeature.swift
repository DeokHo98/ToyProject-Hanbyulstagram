//
//  AppleLoginFeature.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/05/09.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppleLoginFeature {

    // MARK: - Dependency

    private let repository: AuthenticationRepositoryDependency
    private let appleSignInManager: AppleSignInManagerDependency

    init(
        repository: AuthenticationRepositoryDependency = AuthenticationRepository(),
         appleSignInManager: AppleSignInManagerDependency = AppleSignInManager()
    ) {
        self.repository = repository
        self.appleSignInManager = appleSignInManager
    }

    // MARK: - State

    @ObservableState
    struct State: Equatable {
        @Presents var destinationState: Destination.State?
    }

    // MARK: - Action

    enum Action {
        case loginButtonTap
        case loginSucceeded(AppleSignInEntity)
        case showAlert(String)
        case destinationAction(PresentationAction<Destination.Action>)
        case delegate(Delegate)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loginButtonTap:
                WindowProperty.shared.isLoading = true
                return .run { send in
                    do {
                        let entity = try await appleSignInManager.startSignIn()
                        await send(.loginSucceeded(entity))
                    } catch let error {
                        await send(.showAlert(error.localizedDescription))
                        WindowProperty.shared.isLoading = false
                    }
                }
            case .loginSucceeded(let entity):
                return .run { send in
                    let isInvalid = await repository.invalidUser(identifier: entity.userIdentifier)
                    if isInvalid {
                        UserDefaultsManager.isLogin = true
                        UserDefaultsManager.userIdentifier = entity.userIdentifier
                        WindowProperty.shared.isLoading = false
                        WindowProperty.shared.isLoggedIn = true
                    } else {
                        WindowProperty.shared.isLoading = false
                        await send(.delegate(.moveSetNickNameView(entity)))
                    }
                }
            case .showAlert(let error):
                state.destinationState = .alert(.alert(title: error))
            case .destinationAction:
                return .none
            case .delegate:
                return .none
            }
            return .none
        }
        .ifLet(\.$destinationState, action: \.destinationAction)
        ._printChanges()
    }
}

// MARK: - Destination

extension AppleLoginFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case alert(AlertState<AppleLoginFeature.Alert>)
    }
}

// MARK: - Alert Action

extension AppleLoginFeature {
    @CasePathable
    enum Alert {
        case okButtonTap
    }
}

// MARK: - Alert State

extension AlertState where Action == AppleLoginFeature.Alert {
    static func alert(title: String) -> Self {
        onlyOkButtonAlert(title: title)
    }
}

// MARK: - Delegate Action

extension AppleLoginFeature {
    @CasePathable
    enum Delegate: Equatable {
        case moveSetNickNameView(AppleSignInEntity)
    }
}
