//
//  AppViewDelegate.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

extension App {
    
    class Delegate: Stanwood.AbstractCollectionDelegate {
        
        weak var presenter: Presenter!
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let app = dataType?[indexPath] as? DataModel else { return }
            if UIDevice.current.userInterfaceIdiom == .phone {
                collectionView.deselectItem(at: indexPath, animated: true)
            }
            presenter.didSelect(app)
        }
        
    }
}
