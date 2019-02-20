//
//  Build.Delegate.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

extension Build {
    
    class Delegate: Stanwood.AbstractCollectionDelegate {
        
        weak var presenter: Presenter!
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let build = dataType?[indexPath] as? DataModel else { return }
            presenter.didSelect(build)
        }
        
    }
}
