//
//  Log.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


extension Log: Wireframe {
    
    typealias Viewable = LogViewable
    typealias Actions = LogActions
    typealias Parameters = LogParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        return controller
    }
    
}
