//
//  InstagramWithSwiftUIApp.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

final class WindowProperty: ObservableObject {
    static let shared = WindowProperty()

    @Published var isLoading: Bool = false
    @Published var isLogin: Bool = false

    init() {
        self.isLoading = false
        self.isLogin = UserDefaultsManager.isLogin
    }
}

@main
struct InstagramWithSwiftUIApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var windowProperty = WindowProperty.shared

    var body: some Scene {
        WindowGroup {
            ZStack {
                if windowProperty.isLogin {
                    MainTabBarView()
                } else {
                    LogInView()
                }
                if windowProperty.isLoading {
                    CustomLoadingView()
                }
            }
            .environmentObject(windowProperty)
        }
    }
}
