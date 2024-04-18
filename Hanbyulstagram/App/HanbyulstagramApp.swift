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



@main
struct InstagramWithSwiftUIApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var windowProperty = WindowIsLoading.shared

    var body: some Scene {
        WindowGroup {
            ZStack {
                MainTabBarView()
                if windowProperty.isLoading {
                    CustomLoadingView()
                }
            }
            .environmentObject(windowProperty)
        }
    }
}
