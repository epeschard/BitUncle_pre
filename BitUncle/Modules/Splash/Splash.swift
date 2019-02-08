//
//  SplashWireframe.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

enum Splash: Wireframeable {    
    
    typealias Viewable = SplashView
    typealias Actions = SplashActions
    typealias Parameters = SplashParameters

    static func makeViewController(with parameters: Parameters) -> ViewController {
        let controller = ViewController(with: parameters)
        return controller
    }

}
