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
    
    private var loadingView: LoadingView?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func presentSplashScreen() {
        let splashScreen = Splash.makeViewController(with: parameters)
        window.rootViewController = splashScreen
    }
    
    private var rootViewController: UIViewController? {
        return window.rootViewController
    }
    
    private var rootNavigationViewController: UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
    
    func setLoading(_ visible: Bool) {
        main {
            //TODO: Pending
            if visible {
                guard let rootViewController = self.window.rootViewController, self.loadingView?.superview == nil else {
                    self.loadingView?.set(visible: visible)
                    return
                }
                let loadingView = LoadingView()
                rootViewController.view.endEditing(true)
                //            rootViewController.view.addAnimatedSubview(loadingView)
                rootViewController.view.addSubview(loadingView)
                loadingView.pinToSuperview()
                self.loadingView = loadingView
            } else {
                self.loadingView?.removeFromSuperview()
            }
            self.loadingView?.set(visible: visible)
        }
    }
    
    func showAlert(_ error: ApiError, from view: UIViewController) {
        let alert = UIAlertController(title: error.message, message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            print("Alert button tapped")
        })
        alert.addAction(ok)
        view.present(alert, animated: true, completion: nil)
    }
    
    func presentProfile() {
        let profileScreen = Profile.makeViewController(with: actions, and: parameters)
//        let navProfile = UINavigationController(rootViewController: profileScreen)
        window.rootViewController = profileScreen
    }
    
    func askForToken() {
        let alert = UIAlertController(title: "Enter Bitrise Token", message: "Get your token here", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            print("Alert button tapped")
        })
        let guide = UIAlertAction(title: "Guide me", style: .default, handler: { action in
            guard let url = URL(string: "https://devcenter.bitrise.io/api/v0.1/#authentication") else { return }
            UIApplication.shared.open(url)
        })
        alert.addTextField { (tokenField) in
            print("token: \(tokenField.text ?? "N/A")")
        }
        alert.addAction(ok)
        alert.addAction(guide)
        
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}
