//
//  ArtifactViewable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

protocol ArtifactViewable: AnyObject {
    func reload()
    func setLoading(visible: Bool)
}
