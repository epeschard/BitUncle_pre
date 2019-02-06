//
//  Coordinator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import StanwoodCore

class Coordinator {
    let window: UIWindow
    var parameters: Parameters!
    var actions: Actions!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func presentSplashController() {
        let splashScreen = Splash.makeViewController(with: actions, and: parameters)
        window.rootViewController = splashScreen
    }
    
    private var rootViewController: UIViewController? {
        return window.rootViewController
    }
    
    private var rootNavigationViewController: UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
}
