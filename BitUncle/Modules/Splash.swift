//
//  SplashWireframe.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

enum Splash: Wireframeable {    
    
    typealias Viewable = SplashView
    typealias Actions = SplashActions
    typealias Parameters = SplashParameters

    static func makeViewController(with actions: Actions, and parameters: Parameters) -> ViewController {
        let controller = ViewController(with: actions, and: parameters)
        return controller
    }

}
