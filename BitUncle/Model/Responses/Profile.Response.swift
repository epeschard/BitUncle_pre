//
//  Profile.Response.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation

extension Profile {
    
    typealias Completion = (Result<DataModel>) -> Void
    
    struct Response: Codable {
        let profile: DataModel
        
        private enum CodingKeys: String, CodingKey {
            case profile = "data"
        }
    }
    
}
