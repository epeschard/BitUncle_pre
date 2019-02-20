//
//  Profile.DataSource.swift
//  BitUncle
//
//  Created by Eugène Peschard on 20/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Profile {
    
    class DataSource: NSObject, UITableViewDataSource {
        
        weak var presenter: Presenter?
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProfileCell")
            let NA = Localized.Profile.Label.loading
            switch indexPath.row {
            case 0:
                cell.detailTextLabel?.text = Localized.Profile.Label.username
                cell.textLabel?.text = presenter?.profile?.username ?? NA
                cell.selectionStyle = .none
            case 1:
                cell.detailTextLabel?.text = Localized.Profile.Label.email
                cell.textLabel?.text = presenter?.profile?.email ?? NA
                cell.selectionStyle = .none
            case 2:
                cell.detailTextLabel?.text = Localized.Profile.Label.slug
                cell.textLabel?.text = presenter?.profile?.slug ?? NA
                cell.selectionStyle = .none
            default:
                cell.textLabel?.text = Localized.Profile.Label.logout
                cell.selectionStyle = .default
            }
            return cell
        }
        
    }
    
}
