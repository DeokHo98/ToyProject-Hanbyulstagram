//
//  TCA_AlertExtension.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/05/10.
//

import Foundation
import ComposableArchitecture

extension AlertState {
   static func onlyOkButtonAlert(title: String) -> Self {
        AlertState(title: {
            TextState(title)
        }, actions: {
            ButtonState(role: .none) {
                TextState("확인")
            }
        })
    }
}
