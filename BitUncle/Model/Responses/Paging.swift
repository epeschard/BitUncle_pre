//
//  Paging.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

struct Paging: Codable {
    let next: String
    let pageItemLimit: Int
    let totalItemCount: Int
}
