//
//  AppDelegate.swift
//  Overdue
//
//  Created by Garima Bothra on 04/05/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let launcedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        if launcedBefore {
            let unix = UserDefaults.standard.integer(forKey: "firstUnixTime")
            let overboard = UserDefaults.standard.integer(forKey: "overboardMoney")
            print("Launched before. Overboard: \(overboard)")
            
        }
        else
        {
            UserDefaults.standard.set(true,forKey: "hasLaunchedBefore")
            UserDefaults.standard.set(100, forKey: "overboardMoney")
            print("First time")
        }
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


}

