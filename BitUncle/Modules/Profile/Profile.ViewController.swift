//
//  Profile.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Profile {
    
    @objc (ProfileViewController)
    class ViewController: UITableViewController, Viewable, UIPopoverPresentationControllerDelegate {
        
        var presenter: Presenter!
        
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
            title = Localized.Profile.Label.title
            setup()
            presenter.viewDidLoad()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        private func setup() {
            assert(self.navigationController != nil)
        }
        
        func reload() {
            tableView.reloadData()
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
            cell.detailTextLabel?.textColor = UIColor.Bitrise.purple
            let NA = Localized.Profile.Label.loading
            switch indexPath.row {
            case 0:
                cell.detailTextLabel?.text = Localized.Profile.Label.username
                cell.textLabel?.text = presenter.profile?.username ?? NA
                cell.selectionStyle = .none
            case 1:
                cell.detailTextLabel?.text = Localized.Profile.Label.email
                cell.textLabel?.text = presenter.profile?.email ?? NA
                cell.selectionStyle = .none
            case 2:
                cell.detailTextLabel?.text = Localized.Profile.Label.slug
                cell.textLabel?.text = presenter.profile?.slug ?? NA
                cell.selectionStyle = .none
            default:
                cell.textLabel?.text = Localized.Profile.Label.logout
                cell.selectionStyle = .default
            }
            return cell
        }
        
        // MARK: - UITableViewControllerDelegate
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            switch indexPath.row {
            case 3:
                KeyChain.deleteToken()
            default:
                debugPrint("Nothing to do here")
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .popover
    }
}

