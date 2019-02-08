//
//  Profile.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit
import StanwoodCore

extension Profile {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        var profile: DataModel? {
            didSet {
                viewable?.reload()
            }
        }
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actions = actions
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            getProfile()
        }
        
        func getProfile() {
            actions.getProfile {
                [weak self] result in
                switch result {
                case .success(let profile):
                    self?.profile = profile
                case .failure(let error):
                    self?.actions.showAlert(error)
                }
                self?.actions.setLoading(visible: false)
            }
        }
        
        func showAlert(_ error: ApiError, from viewController: UIViewController) {
            actions.showAlert(error)
        }
    }
}
