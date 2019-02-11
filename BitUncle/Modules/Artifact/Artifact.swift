//
//  Artifact.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

enum Artifact: Wireframeable {
    
    typealias Viewable = ArtifactViewable
    typealias Actions = ArtifactActions
    typealias Parameters = ArtifactParameters
    
    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        return controller
    }
    
}
