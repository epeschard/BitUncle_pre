//
//  ProfileActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


protocol ProfileActions: Loadable, ErrorActionable {
    func getProfile(completion: @escaping Profile.Completion)
}

extension Actions: ProfileActions {
    
    func getProfile(completion: @escaping Profile.Completion) {
        dataProvider.networkManager.getProfile(completion: completion)
    }
}
