//
//  NetworkManager.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

class NetworkManager {
    
    private var internetRequest: InternetRequestable
    
    required init(internetRequest: InternetRequestable) {
        self.internetRequest = internetRequest
    }
}
