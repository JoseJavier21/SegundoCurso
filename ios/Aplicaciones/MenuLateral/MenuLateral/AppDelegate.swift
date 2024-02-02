//
//  AppDelegate.swift
//  MenuLateral
//
//  Created by dam2 on 23/1/24.
//

import UIKit
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


    func useMenuGestures(){
        
        // Define the menus
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: ViewController())
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController

        let rightMenuNavigationController = SideMenuNavigationController(rootViewController: ViewController())
        SideMenuManager.default.rightMenuNavigationController = rightMenuNavigationController

        // Setup gestures: the left and/or right menus must be set up (above) for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.default.addPanGestureToPresent(toView: leftMenuNavigationController.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: leftMenuNavigationController.view)

        // (Optional) Prevent status bar area from turning black when menu appears:
        leftMenuNavigationController.statusBarEndAlpha = 0
        // Copy all settings to the other menu
        rightMenuNavigationController.settings = leftMenuNavigationController.settings
        
    }
}

