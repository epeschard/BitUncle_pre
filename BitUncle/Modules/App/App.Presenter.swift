//
//  App.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

extension App {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        let dataSource = DataSource(dataType: Stanwood.Elements<DataModel>(items: []))
        let delegate = Delegate(dataType: Stanwood.Elements<DataModel>(items: []))
        
        var profile: Profile.DataModel? {
            didSet {
                viewable?.updateProfile()
            }
        }
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actions = actions
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            delegate.presenter = self
//            dataSource.presenter = self
        }
        
        func fetchApps() {
            viewable?.setLoading(visible: true)
            actions.getApps {
                [weak self] result in
                switch result {
                case .success(let data):
                    let elements = Stanwood.Elements(items: data)
                    self?.dataSource.update(with: elements)
                    self?.delegate.update(with: elements)
                    self?.viewable?.reload()
                case .failure(let error):
                    self?.actions.showAlert(error)
                }
                self?.viewable?.setLoading(visible: false)
            }
        }
        
        func didSelect(_ app: DataModel) {
            parameters.appSlug = app.slug
            parameters.appName = app.title
            actions.showDetailBuilds()
        }
        
        func showProfile(from navigable: Navigable) {
            actions.presentProfile(from: navigable)
        }
        
    }
}
