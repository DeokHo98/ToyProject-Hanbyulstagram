//
//  SetNickNameFeature.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/05/10.
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct SetNickNameFeature {

    // MARK: - Dependency

    private let repository: AuthenticationRepositoryDependency

    init(repository: AuthenticationRepositoryDependency = AuthenticationRepository()) {
        self.repository = repository
    }

    // MARK: - State

    @ObservableState
    struct State: Equatable {
        @Presents var destinationState: Destination.State?
        var entity: AppleSignInEntity
        var signUpButtonDisabled: Bool = true
        var signUpButtonColor: Color = .gray
        var nickName = ""

        init(entity: AppleSignInEntity) {
            self.entity = entity
        }
    }

    // MARK: - Action

    enum Action {
        case editingText(String)
        case signUpButtonTap
        case destinationAction(PresentationAction<Destination.Action>)
        case showAlert(String)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .editingText(let text):
                state.nickName = text
                state.signUpButtonDisabled = text == ""
                state.signUpButtonColor = text == "" ? .gray : Color(uiColor: .systemBlue)
            case .signUpButtonTap:
                WindowProperty.shared.isLoading = true
                return .run { [state] send in
                    do {
                        let DTO = UserDTO(id: state.entity.userIdentifier,
                                          userName: state.nickName)
                        try await repository.setUserData(DTO: DTO)
                        WindowProperty.shared.isLoading = false
                        WindowProperty.shared.isLoggedIn = true
                        UserDefaultsManager.userIdentifier = DTO.id
                        UserDefaultsManager.isLogin = true
                    } catch let error {
                        WindowProperty.shared.isLoading = false
                        await send(.showAlert(error.localizedDescription))
                    }
                }
            case .destinationAction:
                return .none
            case .showAlert:
                return .none
            }
            return .none
        }
        ._printChanges()
    }
}

// MARK: - Destination

extension SetNickNameFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case alert(AlertState<SetNickNameFeature.Alert>)
    }
}

// MARK: - Alert Action

extension SetNickNameFeature {
    @CasePathable
    enum Alert {
        case okButtonTap
    }
}

// MARK: - Alert State

extension AlertState where Action == SetNickNameFeature.Alert {
    static func alert(title: String) -> Self {
        onlyOkButtonAlert(title: title)
    }
}
