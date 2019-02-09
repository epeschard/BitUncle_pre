//
//  App.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

enum App: Wireframeable {
    
    typealias Viewable = AppViewable
    typealias Actions = AppActions
    typealias Parameters = AppParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> UINavigationController {
        let controller = ViewController(with: actions, and: parameters)
        let navController = UINavigationController(rootViewController: controller)
        navController.setBitriseAppearance()
        return navController
    }
    
}
