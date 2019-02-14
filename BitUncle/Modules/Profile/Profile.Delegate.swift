//
//  Profile.Delegate.swift
//  BitUncle
//
//  Created by Eugène Peschard on 13/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Profile {
    
    class Delegate: NSObject, UITableViewDelegate {
        
        weak var presenter: Presenter?
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.row {
            case 3:
                KeyChain.deleteToken()
            default:
                debugPrint("Nothing to do here")
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
}
