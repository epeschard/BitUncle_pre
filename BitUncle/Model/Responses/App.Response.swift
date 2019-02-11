//
//  App.Response.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

extension App {
    
    typealias Completion = (Result<[DataModel]>) -> Void
    
    struct Response: Codable {
        let paging: Paging
        let apps: [DataModel]
        
        private enum CodingKeys: String, CodingKey {
            case paging
            case apps = "data"
        }
    }
    
}
