//
//  AppViewable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

protocol AppViewable: AnyObject {
    func reload()
    func presentProfile()
    func setLoading(visible: Bool)
}
