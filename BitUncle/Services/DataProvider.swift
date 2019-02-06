//
//  DataProvider.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

class DataProvider {
    
    fileprivate let appData: AppData
    let networkManager: NetworkManager
    
    init(appData: AppData, networkManager: NetworkManager) {
        self.appData = appData
        self.networkManager = networkManager
    }
}
