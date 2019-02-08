//
//  ColmnFlowLayout.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    var cellHeight = CGFloat(65.0)
    
    override func prepare() {
        super.prepare()
        
        guard let cv = collectionView else { return }
        
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        
        let minColumnWidth = CGFloat(300.0)
        let maxColumnCount = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxColumnCount)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
    
}
