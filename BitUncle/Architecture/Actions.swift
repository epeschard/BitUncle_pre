//
//  Actions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit
import StanwoodCore

class Actions {
    
    let appData: AppData
    let dataProvider: DataProvider
    let coordinator: Coordinator
    
    init(appData: AppData, dataProvider: DataProvider, coordinator: Coordinator) {
        self.appData = appData
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }
    
}

extension Actions: Loadable {
    
    func setLoading(visible: Bool) {
        coordinator.setLoading(visible)
    }
    
}

extension Actions: ErrorActionable {
    
    func showAlert(_ error: ApiError?) {
        guard let error = error else { return }
        coordinator.showAlert(error)
    }
}
