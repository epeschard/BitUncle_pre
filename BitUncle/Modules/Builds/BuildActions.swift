//
//  BuildActionable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol BuildActions: ErrorActionable {
    func getBuilds(for appSlug: String, completion: @escaping Build.Completion)
    func showDetailLog()
}

extension Actions: BuildActions {
    
    func getBuilds(for appSlug: String, completion: @escaping Build.Completion) {        
        dataProvider.networkManager.getBuilds(for: appSlug, nextPage: appData.nextPage, append: true, completion: completion)
    }
    
    func showDetailLog() {
        coordinator.showLogListView()
    }

}
