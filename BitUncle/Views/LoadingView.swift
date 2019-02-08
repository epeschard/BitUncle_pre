//
//  LoadingView.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var shouldSetupConstraints = true
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.color = UIColor.Bitrise.purple
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addAutolayoutView(spinner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            NSLayoutConstraint.activate([
                spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
                ])
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func set(visible: Bool) {
        if visible {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
    
}
