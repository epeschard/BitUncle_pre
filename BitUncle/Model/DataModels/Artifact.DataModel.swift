//
//  Artifact.DataModel.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

enum Artifact {
    
    struct DataModel: Typeable, Codable {
        
        let artifactType: String
        let fileSizeBytes: Int
        let isPublicPageEnabled: Bool
        let slug: String
        let title: String
        
        private enum CodingKeys: String, CodingKey {
            case artifactType
            case fileSizeBytes
            case isPublicPageEnabled
            case slug
            case title
        }
        
        static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
            return lhs.slug == rhs.slug
        }
        
    }
    
}
