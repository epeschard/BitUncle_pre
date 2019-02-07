//
//  Result.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation

enum Result<Element:Codable> {
    case success(Element)
    case failure(ApiError)
}