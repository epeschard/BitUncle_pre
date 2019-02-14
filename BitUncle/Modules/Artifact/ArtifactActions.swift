//
//  ArtifactActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol ArtifactActions: ErrorActionable {
    func getArtifacts(for appSlug: String, with buildSlug: String, completion: @escaping Artifact.Completion)
}

extension Actions: ArtifactActions {
    
    func getArtifacts(for appSlug: String, with buildSlug: String, completion: @escaping Artifact.Completion) {
        dataProvider.networkManager.getArtifacts(for: appSlug, with: buildSlug, completion: completion)
    }
}
