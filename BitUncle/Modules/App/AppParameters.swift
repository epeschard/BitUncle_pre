//
//  AppParameters.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

protocol AppParameters {
    var nextPage: String? { get set }
    var appSlug: String { get set }
    var appName: String { get set }
}

extension Parameters: AppParameters {
    var nextPage: String? {
        get {
            return appData.nextPage
        }
        set {
            appData.nextPage = newValue
        }
    }
    
    var appSlug: String {
        get {
            return appData.appSlug
        }
        set {
            appData.appSlug = newValue
        }
    }
    
    var appName: String {
        get {
            return appData.appName
        }
        set {
            appData.appName = newValue
        }
    }
}
