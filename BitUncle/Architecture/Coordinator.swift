//
//  Coordinator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class Coordinator {
    let window: UIWindow
    var parameters: Parameters!
    var actions: Actions!
    
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
    
    private var rootSplitViewController: UISplitViewController? {
        return window.rootViewController as? UISplitViewController
    }
    
    func showAlert(_ error: ApiError) {
        let alert = UIAlertController(title: error.message, message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: Localized.Error.ok, style: .default, handler: nil)
        alert.addAction(ok)
        rootViewController?.present(alert, animated: true) {
            alert.view.tintColor = UIColor.Bitrise.brightPurple
        }
    }
    
    func askForToken(completion: @escaping () -> Void) {
        let alert = UIAlertController(title: Localized.Token.Alert.title, message: Localized.Token.Alert.message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Localized.Token.Alert.ok, style: .default, handler: { action in
            if let tokenTextField = alert.textFields?[0],
                let tokenText = tokenTextField.text,
                let token = tokenText.data(using: .utf8) {
                _ = KeyChain.save(key: "token", data: token)
                completion()
            }
        })
        ok.isEnabled = false
        alert.addTextField {
            (textFieldEmail: UITextField!) in
            textFieldEmail.placeholder = Localized.Token.Alert.placeholder            
        }
        // toggle the OK button when text is added/removed
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: alert.textFields![0], queue: OperationQueue.main) { (notification) in
            let tokenTextField = alert.textFields![0]
            ok.isEnabled = self.isValidToken(tokenTextField.text)
        }
        
        let guide = UIAlertAction(title: Localized.Token.Alert.guide, style: .default, handler: { action in
            UIApplication.shared.open(Configuration.tokenGuide)
        })
        alert.addAction(ok)
        alert.addAction(guide)
                
        rootViewController?.present(alert, animated: true) {
            alert.view.tintColor = UIColor.Bitrise.brightPurple
        }
    }
    
    private func isValidToken(_ token: String?) -> Bool {
        guard let token = token else { return false }
        return token.count > 0
    }
    
    func insertSplitViewController() {
        window.rootViewController?.removeFromParent()
        window.rootViewController = nil
        
        let split = UISplitViewController()
        let master = App.makeViewController(with: actions, and: parameters)
        let detail = Build.makeViewController(with: actions, and: parameters)
        split.viewControllers = [master, detail]
        if let delegate = master.topViewController as? App.ViewController {
            split.delegate = delegate
        }
        window.rootViewController = split
    }
    
    func presentProfile(from viewController: UIViewController) {
        let barButtonItem = viewController.navigationItem.rightBarButtonItem
        let popoverScreen = Profile.makeViewController(with: actions, and: parameters)
        popoverScreen.modalPresentationStyle = .popover
        if let popover = popoverScreen.popoverPresentationController {
            popover.barButtonItem = barButtonItem
            popover.delegate = popoverScreen
            popover.permittedArrowDirections = .up
            popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: 172.5)
            viewController.present(popoverScreen, animated: true, completion: nil)
        }
    }
    
    func presentApps() {
        let appScreen = App.makeViewController(with: actions, and: parameters)
        rootSplitViewController?.show(appScreen, sender: self)
    }
    
    func presentBuilds() {
        let buildScreen = Build.makeViewController(with: actions, and: parameters)
        rootSplitViewController?.showDetailViewController(buildScreen, sender: self)
    }
    
    func presentLog() {
        let logScreen = Log.makeViewController(with: actions, and: parameters)
        rootSplitViewController?.showDetailViewController(logScreen, sender: self)
    }
    
    func presentArtifacts(from viewController: UIViewController) {
        let barButtonItem = viewController.navigationItem.rightBarButtonItem
        let popoverScreen = Artifact.makeViewController(with: actions, and: parameters)
        popoverScreen.modalPresentationStyle = .popover
        if let popover = popoverScreen.popoverPresentationController {
            popover.barButtonItem = barButtonItem
            popover.delegate = popoverScreen
            popover.permittedArrowDirections = .up
            popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: 176)
            viewController.present(popoverScreen, animated: true, completion: nil)
        }
    }
}

