//
//  Profile.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Profile {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        var dataSource: DataSource!
        var delegate: Delegate!
        
        var profile: DataModel? {
            didSet {
                viewable?.reload()
            }
        }
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actions = actions
            self.parameters = parameters
            
            delegate = Delegate()
            dataSource = DataSource()
            delegate.presenter = self
            dataSource.presenter = self
        }
        
        func viewDidLoad() {
            getProfile()
        }
        
        func getProfile() {
            viewable?.setLoading(visible: true)
            actions.getProfile {
                [weak self] result in
                switch result {
                case .success(let profile):
                    self?.profile = profile
                case .failure(let error):
                    self?.actions.showAlert(error)
                }
                self?.viewable?.setLoading(visible: false)
            }
        }
        
        func showAlert(_ error: ApiError, from viewController: UIViewController) {
            actions.showAlert(error)
        }
    }
}
