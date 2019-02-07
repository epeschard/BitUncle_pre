//
//  SplashActionable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//


protocol SplashActions {
    func loadInitialData(onCompletion: @escaping SuccessCompletion)
}

extension AppController: SplashActions {
    
    func loadInitialData(onCompletion: @escaping SuccessCompletion) {
        loadRemoteConfig(onCompletion: onCompletion)
    }
    
    private func loadRemoteConfig(onCompletion: @escaping SuccessCompletion) {
        Configuration.downloadRemoteConfigValues { (success) in
            onCompletion(success)
        }
    }
    
}
