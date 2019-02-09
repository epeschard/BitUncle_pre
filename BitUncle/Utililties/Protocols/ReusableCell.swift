//
//  ReusableCell.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

protocol ReuseAndFillable: class, Fillable {
    static var reuseType: ReuseType { get }
    static var reuseIdentifier: String { get }
}

//MARK:- Extensions

extension ReuseAndFillable {
    public static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
        
    }
    public static var reuseType: ReuseType {
        return .classReference(self)
    }
}

enum ReuseType {
    case nib(UINib)
    case classReference(AnyClass)
}
