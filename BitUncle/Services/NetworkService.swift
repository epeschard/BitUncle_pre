//
//  NetworkService.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation


protocol InternetRequestable {
    func request(_ connection: @escaping ReachabilityBlock)
}

class NetworkService: InternetRequestable {
    
    private(set) var isInternetAvailable = true
    
    func request(_ connection: @escaping ReachabilityBlock) {
        if isInternetAvailable {
            connection()
        }
    }
}
