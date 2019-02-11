//
//  Log.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

enum Log: Wireframeable {
    
    typealias Viewable = LogViewable
    typealias Actions = LogActions
    typealias Parameters = LogParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> UINavigationController {
        let controller = ViewController(with: actions, and: parameters)
        let navController = UINavigationController(rootViewController: controller)
        return navController
    }
    
}
