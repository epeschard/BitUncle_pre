//
//  BuildParameters.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

protocol BuildParameters: AppParameters {
    var nextPage: String? { get set }
    var buildSlug: String { get set }
    var buildName: String { get set }
}

extension Parameters: BuildParameters {
    
    var buildSlug: String {
        get {
            return appData.buildSlug
        }
        set {
            appData.buildSlug = newValue
        }
    }
    
    var buildName: String {
        get {
            return appData.buildName
        }
        set {
            appData.buildName = newValue
        }
    }
    
}
