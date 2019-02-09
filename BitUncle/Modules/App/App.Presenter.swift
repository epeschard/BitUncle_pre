//
//  App.Presenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension App {
    
    class Presenter {
        
        weak var viewable: Viewable?
        var parameters: Parameters
        var actionable: Actions
        
        let dataSource = DataSource(dataType: Stanwood.Elements<DataModel>(items: []))
        let delegate = Delegate(dataType: Stanwood.Elements<DataModel>(items: []))
        
        required init(_ view: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
            self.viewable = view
            self.actionable = actions
            self.parameters = parameters
        }
        
        func viewDidLoad() {
            actionable.getApps {
                result in
                switch result {
                case .success(let data):
                    let elements = Stanwood.Elements(items: data)
                    self.dataSource.update(with: elements)
                    self.delegate.update(with: elements)
                    self.viewable?.reload()
                case .failure(let error):
                    self.actionable.showAlert(error)
                }
                self.actionable.setLoading(visible: false)
            }
            delegate.presenter = self
//            dataSource.presenter = self
        }
        
        func didSelect(_ app: DataModel) {
            parameters.appSlug = app.slug
            parameters.appName = app.title
        }
        
        func showProfile() {
            actionable.showProfile()
        }
        
    }
}