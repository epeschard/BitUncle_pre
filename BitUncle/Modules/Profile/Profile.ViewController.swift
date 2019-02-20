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
    class ViewController: UIViewController, Navigable, Viewable, UIPopoverPresentationControllerDelegate {
        
        var presenter: Presenter!
        var tableView: UITableView!
        var spinner: UIActivityIndicatorView!
        
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
            setup()
            presenter.viewDidLoad()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        // MARK: - Internal
        
        private func setup() {
            
            title = Localized.Profile.Label.title
            setupTableView()
            setupSpinner()
        }
        
        private func setupTableView() {
            tableView = UITableView(frame: .zero, style: .plain)
            view.addSubview(tableView)
            tableView.pinToSuperview()
            self.tableView.dataSource = presenter.dataSource
            self.tableView.delegate = presenter.delegate
        }
        
        private func setupSpinner() {
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.color = UIColor.Bitrise.purple
            self.spinner.hidesWhenStopped = true
            self.spinner.translatesAutoresizingMaskIntoConstraints = false
            tableView.addSubview(spinner)
            self.spinner?.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
            self.spinner?.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor).isActive = true
        }
        
        // MARK: - UIPopoverPresentationControllerDelegate
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        // MARK: - Viewable
        
        func reload() {
            tableView.reloadData()
        }
        
        func setLoading(visible: Bool) {
            if visible {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }

    }
    
}
