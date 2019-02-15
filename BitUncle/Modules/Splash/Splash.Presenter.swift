//
//  Splash.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


extension Splash {
    
    class Presenter {
        weak var viewable: Viewable?
        var parameters: Parameters
        
        required init(_ view: Viewable? = nil, with parameters: Parameters) {
            self.viewable = view
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            viewable?.setLoadingIndicator(visible: true)
        }
        
    }
    
}
