//
//  UserDefaultManager.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import Foundation

enum UserDefaultsManager {
    //로그인 확인값
    @UserDefaultsPropertyWrapper(key: .isLogin, optionalValue: false)
    static var isLogin: Bool

    //로그인 Identifier
    @UserDefaultsPropertyWrapper(key: .userIdentifier, optionalValue: "")
    static var userIdentifier: String

}
