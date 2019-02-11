//
//  LogActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol LogActions: Loadable, ErrorActionable {
    func getLog(for appSlug: String, with buildSlug: String, completion: @escaping Log.Completion)
    func presentArtifacts()
}

extension Actions: LogActions {
    
    func getLog(for appSlug: String, with buildSlug: String, completion: @escaping Log.Completion) {
        dataProvider.networkManager.getLog(for: appSlug, with: buildSlug, completion: completion)
    }
    
    func presentArtifacts() {
        coordinator.presentArtifacts()
    }
    
}
