//
//  AppController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import Firebase
import StanwoodCore

class AppController: NSObject {
    
    let appData = AppData()
    var window: UIWindow
    let dataProvider: DataProvider
    
    let coordinator: Coordinator
    let actions: Actions
    let parameters: Parameters
    
    let networkService = NetworkService()
        
    init(with window: UIWindow) {
        self.window = window

        let networkManager = NetworkManager(internetRequest: networkService)
        dataProvider = DataProvider(appData: appData, networkManager: networkManager)
        
        parameters = Parameters(appData: appData)
        
        coordinator = Coordinator(window: window)
        
        actions = Actions(appData: appData, dataProvider: dataProvider, coordinator: coordinator)
        super.init()
        coordinator.actions = actions
        coordinator.parameters = parameters
    }
    
    func start(with application: UIApplication) {
        RemoteConfig.remoteConfig().setDefaults(fromPlist: "RemoteConfig")
        
        window.rootViewController?.removeFromParent()
        window.rootViewController = nil
        let splashScreen = Splash.makeViewController(with: parameters)
        window.rootViewController = splashScreen
        
        // Delay of 500 milliseconds to wait for reachability to check for connections
        StanwoodCore.main(deadline: .milliseconds(500)) {
            self.networkService.request {
                self.loadInitialData()
            }
        }
    }
    
    private func loadInitialData() {
        loadInitialData { [weak self] (success) in
            if let _ = KeyChain.getToken() {
                self?.coordinator.insertSplitViewController()
            } else {
                self?.coordinator.askForToken() {
                    self?.loadInitialData()
                }
            }
        }
    }
}

// MARK:- AppDelegate Functions

extension AppController {
    
    func didFinishLaunching(_ application: UIApplication, with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func didRegisterForRemoteNotifications(of application: UIApplication, with deviceToken: Data) {
        // TODO:
    }
    
    func didFailToRegister(_ application: UIApplication, forRemoteNotificationsWith error: Error) {
        // TODO:
    }
    
    func didReceiveRemoteNotification(_ userInfo: [AnyHashable : Any], for application: UIApplication, with completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // TODO:
        completionHandler(.noData)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // TODO:
        return true
    }
    
    func open(_ url: URL, in application: UIApplication, with options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // TODO:
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // TODO:
        return true
    }
    
    func performFetch(for application: UIApplication, with completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // TODO:
        completionHandler(.noData)
    }
    
    func didBecomeActive(_ application: UIApplication) {
        print("Came back from background")
        loadInitialData()
    }
    
    func willEnterForeground(_ application: UIApplication) {
        // TODO:
        //        NotificationCenter.default.post(name: NSNotification.Name.AppWillEnterForeground, object: nil)
    }
    
    func applicationDidEnterBackground() {
        // TODO:
        //        NotificationCenter.default.post(name: NSNotification.Name.AppDidEnterBackground, object: nil)
    }
    
    func willTerminate(_ application: UIApplication) {
        // TODO:
    }
    
    func supportedInterfaceOrientations(for window: UIWindow?, in application: UIApplication) -> UIInterfaceOrientationMask {
        // TODO:
        return .all
    }
    
    func willResignActive(_ application: UIApplication) {
        // TODO:
    }
    
}
