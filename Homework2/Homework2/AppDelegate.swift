//
//  AppDelegate.swift
//  Homework2
//
//  Created by Ruslan Khanov on 29.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        configureNavigationBar()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    // MARK: - UINavigationBar appearance

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = Appearance.NavigationBar.titleTextAttributes
        appearance.largeTitleTextAttributes = Appearance.NavigationBar.largeTitleTextAttributes
        appearance.backgroundColor = Assets.Colors.navigationBarBackground.color

        UINavigationBar.appearance().backIndicatorImage = Assets.Images.backButton.image
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = Assets.Images.backButton.image
        UINavigationBar.appearance().tintColor = Assets.Colors.darkGreySocialWhite.color
        UINavigationBar.appearance().backItem?.title = ""
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(
            Appearance.BarButtonItem.backButtonTitlePositionAdjustment,
            for: .default
        )

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

