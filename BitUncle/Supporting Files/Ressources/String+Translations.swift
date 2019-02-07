//
//  String+Translations.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation

typealias Localized = String.Localized

extension String {
    
    enum Localized {
        enum Splash {
            enum Label {
                static let unofficialClient = "UNOFFICIAL_CLIENT".localized
            }
        }
    }
}
