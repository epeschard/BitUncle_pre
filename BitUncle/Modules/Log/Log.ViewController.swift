//
//  Log.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Log {
    
    @objc (LogViewController)
    class ViewController: UIViewController, Viewable, Navigable {
        
        var presenter: Presenter!
        var tableView: UITableView!
        var spinner: UIActivityIndicatorView!
        
        var artifactsBarButtonItem: UIBarButtonItem {
            return UIBarButtonItem(title: Localized.Log.BarButton.artifacts, style: .plain, target: self, action: #selector(showArtifacts))
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
            title = presenter.parameters.buildName
            setup()
            presenter.viewDidLoad()
            navigationItem.rightBarButtonItem = artifactsBarButtonItem
        }
        
        private func setup() {
            assert(self.navigationController != nil)
            
            setupTableView()
            setupSpinner()
            addProfileBarButton()
        }
        
        private func setupTableView() {
            view.backgroundColor = UIColor.Bitrise.logBackground
            tableView = UITableView(frame: .zero, style: .plain)
            view.addSubview(tableView)
            tableView.pinToSuperview()
            tableView.backgroundColor = UIColor.Bitrise.logBackground
            tableView.separatorStyle = .none
            tableView.registerReusableCell(Cell.self)
            tableView.dataSource = presenter.dataSource
            tableView.delegate = presenter.delegate
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
        
        private func addProfileBarButton() {
            let profileButton = UIBarButtonItem(image: #imageLiteral(resourceName: "profile.pdf"), style: .plain, target: self, action: #selector(presentArtifacts))
            navigationItem.rightBarButtonItem = profileButton
        }
        
        @objc private func presentArtifacts() {
            presenter.showArtifacts(from: self)
        }
        
        //MARK: - AppViewable

        func reload() {
            self.tableView.reloadData()
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
