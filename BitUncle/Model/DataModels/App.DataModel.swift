//
//  App.DataModel.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

enum App {
    
    struct DataModel: Typeable, Codable {
        
        var title: String
        var projectType: String
        var provider: String
        var slug: String
        var repoOwner: String
        var repoUrl: URL
        var repoSlug: String
        var isDisabled: Bool
        var isPublic: Bool
        var status: Int
        var avatarUrl: URL?
        var owner: Owner
        
        static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
            return lhs.slug == rhs.slug
        }
    }
    
    struct Owner: Codable {
        let accountType: String
        let name: String
        let slug: String
        
        private enum CodingKeys: String, CodingKey {
            case accountType
            case name
            case slug
        }
    }
    
}

/*
 "avatar_url" = "<null>";
 "is_disabled" = 0;
 "is_public" = 0;
 owner =             {
 "account_type" = organization;
 name = stanwood;
 slug = 598674de431b389a;
 };
 "project_type" = ios;
 provider = github;
 "repo_owner" = stanwood;
 "repo_slug" = "IPS_Swift";
 "repo_url" = "git@github.com:stanwood/IPS_Swift.git";
 slug = 66c13e5d3a45b63c;
 status = 1;
 title = "IPS_iOS";
 */
