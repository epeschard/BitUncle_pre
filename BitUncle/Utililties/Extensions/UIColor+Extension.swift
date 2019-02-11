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
        
        static let redText = UIColor(red:0.99, green:0.27, blue:0.31, alpha:1.00)
        static let blueText = UIColor(red:0.184, green:0.506, blue:0.718, alpha:1.00)
        static let yellowText = UIColor(red:0.898, green:0.890, blue:0.192, alpha:1.00)
        static let greenText = UIColor(red:0.224, green:0.796, blue:0.455, alpha:1.00)
        static let darkYellowText = UIColor(red:0.600, green:0.596, blue:0.118, alpha:1.00)
        static let branch = UIColor(red:0.18, green:0.89, blue:0.93, alpha:1.00)
        static let logBackground = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.00)
        
        static func color(for status: Int, with alphaComponent: CGFloat = CGFloat(1.0)) -> UIColor {
            var color = success
            switch status {
            case 0:
                color = purple
            case 1:
                color = success
            case 2:
                color = failed
            case 3:
                color = aborted
            default:
                color = success
            }
            return color.withAlphaComponent(alphaComponent)
        }
        
    }
}
