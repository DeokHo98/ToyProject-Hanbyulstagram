//
//  UserDefaultsPropertyWrapper.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import Foundation

@propertyWrapper
struct UserDefaultsPropertyWrapper<T> {

    private let userDefaults = UserDefaults.standard

    let key: UserDefaultsKey
    let optionalValue: T

    var wrappedValue: T {
        get {
            let value = userDefaults.object(forKey: key.rawValue) as? T
            return value ?? optionalValue
        }
        set {
            userDefaults.set(newValue, forKey: key.rawValue)
        }
    }
}
