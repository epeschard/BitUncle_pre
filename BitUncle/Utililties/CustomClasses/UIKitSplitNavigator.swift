//
//  UIKitSplitNavigator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 15/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class UIKitSplitNavigator: UISplitViewController, Navigator {
    
    func show(_ navigable: Navigable, sender: Any?) {
        guard let viewController = navigable.viewController else { return }
        onMainQueue {
            self.show(viewController, sender: sender)
        }
    }
    
    func showDetail(_ navigable: Navigable, sender: Any?) {
        guard let viewController = navigable.viewController else { return }
        onMainQueue {
            self.showDetailViewController(viewController, sender: sender)
        }
    }
    
    func present(_ navigable: Navigable, completion: Completion?) {
        guard let viewController = navigable.viewController else { return }
        onMainQueue {
            self.present(viewController, animated: true, completion: completion)
        }
    }
    
    func dismiss(completion: Completion?) {
        onMainQueue {
            self.dismiss(animated: true, completion: completion)
        }
    }
    
    func onMainQueue(block: @escaping Completion) {
        DispatchQueue.main.async(execute: block)
    }
}

extension Navigator {
    
    var masterNavController: UINavigationController? {
        if let splitViewController = self as? UISplitViewController {
            return splitViewController.viewControllers.first as? UINavigationController
        }
        return nil
    }
    
    var detailNavController: UINavigationController? {
        if let splitViewController = self as? UISplitViewController, splitViewController.viewControllers.count > 1 {
            return splitViewController.viewControllers[1] as? UINavigationController
        }
        return nil
    }
}

private extension Navigable {
    
    var viewController: UIViewController? {
        return self as? UIViewController
    }
    
    var navigationController: UINavigationController? {
        return self as? UINavigationController
    }
    
    var masterNavController: UINavigationController? {
        if let splitViewController = self as? UISplitViewController {
            return splitViewController.viewControllers.first as? UINavigationController
        }
        return nil
    }
    
    var detailNavController: UINavigationController? {
        if let splitViewController = self as? UISplitViewController, splitViewController.viewControllers.count > 1 {
            return splitViewController.viewControllers[1] as? UINavigationController
        }
        return nil
    }
}
