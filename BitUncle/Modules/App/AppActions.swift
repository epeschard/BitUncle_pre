//
//  AppActions.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

protocol AppActions: ErrorActionable {
    func getApps(completion: @escaping App.Completion)
    func getProfile(completion: @escaping Profile.Completion)
    func presentProfile(from viewController: UIViewController)
    func presentBuilds()
}

extension Actions: AppActions {
    
    func getApps(completion: @escaping App.Completion) {
        let nextPage: String? = nil
        //TODO: add here - response.paging.next
        //        let nextPage: String? = Apps.Paging.next
        
        dataProvider.networkManager.getApps(nextPage: nextPage, append: false, completion: completion)
    }
    
    func presentProfile(from viewController: UIViewController) {
        coordinator.presentProfile(from: viewController)
    }
    
    func presentBuilds() {
        coordinator.presentBuilds()
    }
    
}
