//
//  UIApplicationExtension.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/05/03.
//

import UIKit

extension UIApplication {
    static func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
