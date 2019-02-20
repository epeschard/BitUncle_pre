//
//  BuildViewable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

protocol BuildViewable: AnyObject {
    func reload()
    func setLoading(visible: Bool)
    func showEmptyView(with message: String)
}
