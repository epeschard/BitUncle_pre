//
//  Configuration.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

struct Configuration {
    
    enum RemoteConfigKeys: String {
        case
        baseUrl = "base_url",
        apiKey = "api_key",
        tokenUrl = "token_url"
    }
    
    static func updateConfig(onCompletion: @escaping SuccessCompletion) {
        let remoteConfig = RemoteConfig.remoteConfig()
        
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: Constants.Environment != .release)
        remoteConfig.configSettings = remoteConfigSettings
        remoteConfig.fetch { (status, error) in
            if status == .success {
                remoteConfig.activateFetched()
            }
            onCompletion(status == .success)
        }
    }
    
    static func value<T: Any>(for key: RemoteConfigKeys) -> T? {
        let value = RemoteConfig.remoteConfig()[key.rawValue]
        switch T.self {
        case is String.Type: return value.stringValue as? T
        case is Data.Type: return value.dataValue as? T
        case is Bool.Type: return value.boolValue as? T
        case is Int.Type: return value.numberValue?.intValue as? T
        case is Double.Type: return value.numberValue?.doubleValue as? T
        case is NSNumber.Type: return value.numberValue as? T
            
        default: return nil
        }
    }
    
    static func downloadRemoteConfigValues(onCompletion: @escaping SuccessCompletion) {
        let remoteConfig = RemoteConfig.remoteConfig()
        
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: Constants.Environment == .debug)
        remoteConfig.configSettings = remoteConfigSettings
        remoteConfig.fetch { (status, error) in
            if status == .success {
                remoteConfig.activateFetched()
            }
            onCompletion(status == .success)
        }
    }
    
    static var baseURL: URL = URL(string: "https://api.bitrise.io")!
}
