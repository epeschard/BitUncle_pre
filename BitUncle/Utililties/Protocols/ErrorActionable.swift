//
//  ErrorActionable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit

protocol ErrorActionable {
    func showAlert(_ error: ApiError?, from view: UIViewController)
}