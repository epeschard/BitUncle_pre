//
//  Splash.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit

extension Splash {
    
    class Presenter {
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actions = actions
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            viewable?.setLoadingIndicator(visible: true)
        }
        
    }
    
}
