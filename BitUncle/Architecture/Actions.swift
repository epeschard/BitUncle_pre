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
