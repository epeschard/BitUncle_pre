//
//  Build.Response.swift
//  BitUncle
//
//  Created by Eugène Peschard on 10/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

extension Build {
    
    typealias Completion = (Result<[DataModel]>) -> Void
    
    struct Response: Codable {
        let paging: Paging
        let builds: [DataModel]
        
        private enum CodingKeys: String, CodingKey
        {
            case paging
            case builds = "data"
        }
    }
    
}
