//
//  Artifact.DataSource.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Artifact {
    
    class DataSource: Stanwood.AbstractTableDataSource {
        
        weak var presenter: Presenter?
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: Cell = tableView.dequeueReusableCell(for: indexPath)
            cell.fill(with: dataType?[indexPath])
            return cell
        }
        
    }
}
