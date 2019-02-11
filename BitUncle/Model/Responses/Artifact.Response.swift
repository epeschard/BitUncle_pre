//
//  Artifact.Response.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

extension Artifact {
    
    typealias Completion = (Result<[DataModel]>) -> Void
    
    struct Response: Codable {
        //        let paging: Paging
        let artifacts: [DataModel]
        
        private enum CodingKeys: String, CodingKey {
            //            case paging
            case artifacts = "data"
        }
    }
    
}

/*
 {
 "data": [
 {
 "artifact_type": "file",
 "file_size_bytes": 10,
 "is_public_page_enabled": true,
 "slug": "0d2277e50b8d32ce",
 "title": "artifact-1.txt"
 },
 {
 "artifact_type": "file",
 "file_size_bytes": 11,
 "is_public_page_enabled": false,
 "slug": "b69c23de1f13b998",
 "title": "artifact-2.txt"
 }
 ],
 "paging": {
 "page_item_limit": 50,
 "total_item_count": 2
 }
 }
 }
 */
