//
//  Log.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


enum Log: Wireframeable {
    
    typealias Viewable = LogViewable
    typealias Actions = LogActions
    typealias Parameters = LogParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        return controller
    }
    
}
