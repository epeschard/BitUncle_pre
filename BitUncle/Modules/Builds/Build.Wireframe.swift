//
//  Build.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


extension Build: Wireframe {
    
    typealias Viewable = BuildViewable
    typealias Actions = BuildActions
    typealias Parameters = BuildParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        return controller
    }
    
}
