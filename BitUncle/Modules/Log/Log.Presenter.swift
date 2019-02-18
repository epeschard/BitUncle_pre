//
//  Log.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Log {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actions: Actions
        
        let dataSource = DataSource(dataType: Stanwood.Elements<DataModel>(items: []))
        let delegate = Delegate(dataType: Stanwood.Elements<DataModel>(items: []))
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actions = actions
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            viewable?.setLoading(visible: true)
            let appSlug = parameters.appSlug
            let buildSlug = parameters.buildSlug
            actions.getLog(for: appSlug, with: buildSlug) {
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
            delegate.presenter = self
            dataSource.presenter = self
        }
        
        func didSelect(_ log: DataModel) {
//            actionable.unfoldLogChunk(for: buildSlug)
        }
        
        func presentArtifacts(from navigable: Navigable) {
            actions.presentArtifacts(from: navigable)
        }
    }
}
