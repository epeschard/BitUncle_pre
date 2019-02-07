//
//  Profile.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import UIKit

extension Profile {
    
    @objc (ProfileViewController)
    class ViewController: UITableViewController, Viewable {
        
        var presenter: Presenter!
        var profile: DataModel? {
            didSet {
                tableView.reloadData()
            }
        }
        
        // MARK: - Run Loop
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(with actions: Actions, and parameters: Parameters) {
            presenter = Presenter(with: actions, and: parameters)
            super.init(nibName: nil, bundle: nil)
            presenter.viewable = self
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Profile"
            setup()
            presenter.viewDidLoad()
        }
        
        private func setup() {
            assert(self.navigationController != nil)
        }
        
        func showAlert(_ error: ApiError) {
            presenter.showAlert(error, from: self)
        }
        
        // MARK: - UITableViewControllerDatasource
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProfileCell")
            switch indexPath.row {
            case 0:
                cell.detailTextLabel?.text = Localized.Profile.Label.username
                cell.textLabel?.text = profile?.username ?? "N/A"
            case 1:
                cell.detailTextLabel?.text = Localized.Profile.Label.email
                cell.textLabel?.text = profile?.email ?? "N/A"
            default:
                cell.detailTextLabel?.text = Localized.Profile.Label.slug
                cell.textLabel?.text = profile?.slug ?? "N/A"
            }
            return cell
        }
        
    }
}

