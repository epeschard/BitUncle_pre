//
//  AppActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol AppActions: ErrorActionable {
    func getApps(completion: @escaping App.Completion)
    func presentProfile(from navigable: Navigable)
    func showBuilds()
}

extension Actions: AppActions {
    
    func getApps(completion: @escaping App.Completion) {
        let nextPage: String? = nil
        //TODO: add here - response.paging.next
        //        let nextPage: String? = Apps.Paging.next
        
        dataProvider.networkManager.getApps(nextPage: nextPage, append: false, completion: completion)
    }
    
    func presentProfile(from navigable: Navigable) {
        coordinator.presentProfile(from: navigable)
    }
    
    func showBuilds() {
        coordinator.showBuildListView()
    }
    
}
