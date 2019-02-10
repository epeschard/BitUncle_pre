//
//  UIColor+Extension.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension UIColor {
    
    typealias Color = UIColor.Bitrise
    
    enum Bitrise {
        static let purple = UIColor(red:0.28, green:0.18, blue:0.35, alpha:1.00)
        static let green = UIColor(red:0.18, green:0.77, blue:0.65, alpha:1.00)
        static let brightPurple = UIColor(red:0.59, green:0.13, blue:0.75, alpha:1.00)
        static let backgroundGrey = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00)
        static let success = UIColor(red:0.14, green:0.76, blue:0.54, alpha:1.00)
        static let failed = UIColor(red:1.00, green:0.00, blue:0.34, alpha:1.00)
        static let aborted = UIColor(red:1.00, green:0.77, blue:0.18, alpha:1.00)
        
        static func statusColor(status: Int) -> UIColor {
            switch status {
            case 0:
                return purple
            case 1:
                return success
            case 2:
                return failed
            case 3:
                return aborted
            default:
                return success
            }
        }
    }
}
