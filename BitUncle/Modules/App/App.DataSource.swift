//
//  App.DataSource.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension App {
    
    class DataSource: Stanwood.AbstractCollectionDataSource {
                
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: Cell = collectionView.dequeueReusableCell(for: indexPath)
            
            cell.fill(with: dataType?[indexPath])
            return cell
        }
        
    }
}
