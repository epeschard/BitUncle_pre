//
//  Profile.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit

enum Profile: Wireframeable {

    typealias Viewable = ProfileViewable
    typealias Actions = ProfileActions
    typealias Parameters = ProfileParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> UINavigationController {
        let controller = ViewController(with: actions, and: parameters)
        let navController = UINavigationController(rootViewController: controller)
        navController.setBitriseAppearance()
        return navController
    }

}