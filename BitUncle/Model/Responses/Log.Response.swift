//
//  Log.Response.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

extension Log {
    
    typealias Completion = (Result<[DataModel]>) -> Void
    
    struct Response: Codable {
        var expiringRawLogUrl: String
        var generatedLogChunksNum: Int
        var isArchived: Bool
        var logChunks: [DataModel]
        var timestamp: String?
        
        private enum CodingKeys: String, CodingKey {
            case expiringRawLogUrl
            case generatedLogChunksNum
            case isArchived
            case logChunks
            case timestamp
        }
    }
    
}
