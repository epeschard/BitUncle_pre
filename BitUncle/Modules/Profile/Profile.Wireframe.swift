//
//  Profile.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


extension Profile: Wireframe {

    typealias Viewable = ProfileViewable
    typealias Actions = ProfileActions
    typealias Parameters = ProfileParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        
        return controller
    }

}
