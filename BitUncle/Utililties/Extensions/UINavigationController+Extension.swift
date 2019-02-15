//
//  UINavigationController+Extension.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension UINavigationController: Navigable {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    func setBitriseAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = UIColor.Bitrise.purple
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.tintColor = UIColor.Bitrise.green
        appearance.barStyle = .black
    }
}
