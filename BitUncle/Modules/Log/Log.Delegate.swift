//
//  Log.Delegate.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

extension Log {
    
    class Delegate: Stanwood.AbstractTableDelegate {
        
        weak var presenter: Presenter!
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let log = dataType?[indexPath] as? DataModel else { return }
            presenter.didSelect(log)
        }
        
    }
}
