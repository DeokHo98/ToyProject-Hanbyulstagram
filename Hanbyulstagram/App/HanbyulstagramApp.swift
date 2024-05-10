//
//  InstagramWithSwiftUIApp.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI
import FirebaseCore
import ComposableArchitecture

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@Observable
class WindowProperty: ObservableObject {
    static let shared = WindowProperty()

    var isLoggedIn = false
    var isLoading = false

    private init() {} // 외부에서 인스턴스 생성 방지
}

@main
struct InstagramWithSwiftUIApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var windowProperty = WindowProperty.shared

    var body: some Scene {
        WindowGroup {
            ZStack {
                if windowProperty.isLoggedIn || UserDefaultsManager.isLogin {
                    MainTabBarView()
                } else {
                    let store = Store(initialState: LoginFeature.State()) {
                        LoginFeature()
                    }
                    LogInView(store: store)
                }
            }
        }
    }
}
