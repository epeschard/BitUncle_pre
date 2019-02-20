//
//  Build.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Build {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        var dataSource = DataSource(dataType: Stanwood.Elements<DataModel>(items: []))
        var delegate = Delegate(dataType: Stanwood.Elements<DataModel>(items: []))
        
        required init(for viewController: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = viewController
            self.actions = actions
            self.parameters = parameters            
        }
        
        func viewDidLoad() {
            delegate.presenter = self
        }
        
        func fetchBuilds() {
            viewable?.setLoading(visible: true)
            let appSlug = parameters.appSlug
            actions.getBuilds(for: appSlug) {
                [weak self] result in
                switch result {
                case .success(let data):
                    let elements = Stanwood.Elements(items: data)
                    self?.dataSource.update(with: elements)
                    self?.delegate.update(with: elements)
                    self?.viewable?.reload()
                case .failure(let error):
                    if self?.parameters.appSlug == "" {
                        self?.viewable?.showEmptyView(with: Localized.Build.Label.emptyMessage)
                    } else {
                        self?.actions.showAlert(error)
                    }
                }
                self?.viewable?.setLoading(visible: false)
            }
        }
        
        func didSelect(_  build: DataModel) {
            parameters.buildSlug = build.slug
            parameters.buildName = "Build: \(build.buildNumber)"
            actions.showDetailLog()
        }
    }
}
