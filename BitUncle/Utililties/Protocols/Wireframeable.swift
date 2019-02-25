//
//  Wireframeable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

protocol Wireframe {
    associatedtype Viewable
    associatedtype Actions
    associatedtype Parameters
    
//    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController
}

//extension Wireframe {
//    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
//        let controller = ViewController(with: actions, and: parameters)
//        return controller
//    }
//}
