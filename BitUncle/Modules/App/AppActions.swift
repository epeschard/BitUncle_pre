//
//  AppActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol AppActions: ErrorActionable {
    func getApps(completion: @escaping App.Completion)
    func getProfile(completion: @escaping Profile.Completion)
    func presentProfile(from navigable: Navigable)
    func showDetailBuilds()
}

extension Actions: AppActions {
    
    func getApps(completion: @escaping App.Completion) {        
        dataProvider.networkManager.getApps(nextPage: appData.nextPage, append: false, completion: completion)
    }
    
    func presentProfile(from navigable: Navigable) {
        coordinator.presentProfile(from: navigable)
    }
    
    func showDetailBuilds() {
        coordinator.showBuildListView()
    }
    
}
