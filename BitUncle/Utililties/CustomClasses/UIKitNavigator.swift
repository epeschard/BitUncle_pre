//
//  UIKitNavigator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 14/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class UIKitNavigator: UINavigationController, Navigator {    
    
    func push(_ Navigable: Navigable) {
        guard let viewController = Navigable.viewController else { return }
        onMainQueue {
            self.pushViewController(viewController, animated: true)
        }
    }
    
    func show(_ Navigable: Navigable, sender: Any?) {
        guard let viewController = Navigable.viewController else { return }
        onMainQueue {
            self.show(viewController, sender: sender)
        }
    }
    
    func showDetail(_ Navigable: Navigable, sender: Any?) {
        guard let viewController = Navigable.viewController else { return }
        onMainQueue {
            self.showDetailViewController(viewController, sender: sender)
        }
    }
    
    func pop() {
        onMainQueue {
            self.popViewController(animated: true)
        }
    }
    
    func present(_ Navigable: Navigable, completion: VoidBlock?) {
        guard let viewController = Navigable.viewController else { return }
        onMainQueue {
            self.present(viewController, animated: true, completion: completion)
        }
    }
    
    func dismiss(completion: VoidBlock?) {
        onMainQueue {
            self.dismiss(animated: true, completion: completion)
        }
    }
    
    func setMaster(_ navigable: Navigable) {
        fatalError("No master on UINavigationController")
    }
    
    func setDetail(_ navigable: Navigable) {
        fatalError("No detail on UINavigationController")
    }
    
    func onMainQueue(block: @escaping VoidBlock) {
        DispatchQueue.main.async(execute: block)
    }
}

private extension Navigable {
    
    var viewController: UIViewController? {
        return self as? UIViewController
    }
    
    var navigationController: UINavigationController? {
        return self as? UINavigationController
    }
    
}
