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
    
    func showEmptyView(with message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 19.0, weight: .light)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func removeEmptyView() {
        self.backgroundView = nil
    }
}
