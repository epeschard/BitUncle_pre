//
//  LogViewable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

protocol LogViewable: AnyObject {
    func reload()
    func setLoading(visible: Bool)
}
