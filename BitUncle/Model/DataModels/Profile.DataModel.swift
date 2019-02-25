//
//  Profile.DataModel.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

enum Profile {
    
    struct DataModel: Typeable, Codable {
        
        var avatarUrl: String
        var email: String
        var slug: String
        var username: String
        
        static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
            return lhs.slug == rhs.slug
        }
        
        private enum CodingKeys: String, CodingKey {
            case avatarUrl
            case email
            case slug
            case username
        }
    }
}

/*
 {
 "data": {
 "avatar_url": "string",
 "email": "string",
 "slug": "string",
 "unconfirmed_email": "string",
 "username": "string"
 }
 }
 */
