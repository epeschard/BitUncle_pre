//
//  UICollectionView+Extension.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: ReuseAndFillable {
        switch T.reuseType {
        case .classReference(let className):
            self.register(className, forCellWithReuseIdentifier: T.reuseIdentifier)
        case .nib(let nib):
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReuseAndFillable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Did you register this cell?")
        }
        return cell
    }
}
