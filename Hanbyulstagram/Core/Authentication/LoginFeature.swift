//
//  LoginFeature.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/05/09.
//

import Foundation
import ComposableArchitecture

@Reducer
struct LoginFeature {

    // MARK: - State

    @ObservableState
    struct State: Equatable {
        @Presents var destinationState: Destination.State?
        var appleLoginState = AppleLoginFeature.State()
    }

    // MARK: - Action

    enum Action {
        case appleLoginAction(AppleLoginFeature.Action)
        case destinationAction(PresentationAction<Destination.Action>)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.appleLoginState, action: \.appleLoginAction) {
            AppleLoginFeature()
        }
        Reduce { state, action in
            switch action {
            case .appleLoginAction(.delegate(.moveSetNickNameView(let entity))):
                state.destinationState = .pushNickNameView(SetNickNameFeature.State(entity: entity))
            case .appleLoginAction:
                return .none
            case .destinationAction:
                return .none
            }
            return .none
        }
        .ifLet(\.$destinationState, action: \.destinationAction)
        ._printChanges()
    }
}

// MARK: - Destination

extension LoginFeature {
    @Reducer(state: .equatable)
    enum Destination {
        case pushNickNameView(SetNickNameFeature)
    }
}
