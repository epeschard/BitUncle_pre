//
//  PopoverPresenter.swift
//  BitUncle
//
//  Created by Eugène Peschard on 15/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import CoreGraphics

protocol PopoverPresenter: Navigable {
    func present(_ Navigable: Navigable, sender: Any?)
}
