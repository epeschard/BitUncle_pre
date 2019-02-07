//
//  AppDelegate.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appController: AppController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appController = AppController(with: window!)
        appController?.start(with: application)
        
        defer { window?.makeKeyAndVisible() }
        
        guard NSClassFromString("XCTest") == nil else {
            window?.rootViewController = UIViewController()
            return true
        }
        
        return appController?.didFinishLaunching(application, with: launchOptions) ?? true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appController?.didRegisterForRemoteNotifications(of: application, with: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appController?.didFailToRegister(application, forRemoteNotificationsWith: error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appController?.didReceiveRemoteNotification(userInfo, for: application, with: completionHandler)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return appController?.application(application, continue: userActivity, restorationHandler: restorationHandler) ?? true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return appController?.open(url, in: application, with: options) ?? true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appController?.performFetch(for: application, with: completionHandler)
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appController?.didBecomeActive(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        appController?.willEnterForeground(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        appController?.applicationDidEnterBackground()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        appController?.willTerminate(application)
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return appController?.supportedInterfaceOrientations(for: window, in: application) ?? .all
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        appController?.willResignActive(application)
    }
    
}
