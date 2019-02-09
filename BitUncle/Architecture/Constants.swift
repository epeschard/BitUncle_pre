//
//  Constants.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

struct Constants {
    
    enum EnvironmentType: String {
        case debug
        case stage
        case release
        
        var firebasePlist: String {
            switch self {
            case .debug: return "GoogleService-Info-debug"
            case .stage: return "GoogleService-Info-stage"
            case .release: return "GoogleService-Info"
            }
        }
        
    }
    
    enum Notifications: String {
        case appWillEnterForeground, appDidEnterBackground, internetConnectionChanged
    }
    
    static var Environment: EnvironmentType {
        #if DEBUG || STAGE
        return .stage
        #else
        return .release
        #endif
    }
}
