//
//  Artifact.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Artifact {
    
    @objc (ArtifactViewController)
    class ViewController: UIViewController, Viewable, Navigable, UIPopoverPresentationControllerDelegate {
        
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
        
        private func setup() {
            title = "Artifacts"
            setupTableView()
            setupSpinner()
        }
        
        private func setupTableView() {
            tableView = UITableView(frame: .zero, style: .plain)
            view.addSubview(tableView)
            tableView.pinToSuperview()
            tableView.registerReusableCell(Cell.self)
            tableView.dataSource = presenter.dataSource
            tableView.delegate = presenter.delegate
        }
        
        private func setupSpinner() {
            spinner = UIActivityIndicatorView(style: .whiteLarge)
            spinner.color = UIColor.Bitrise.purple
            spinner.hidesWhenStopped = true
            spinner.translatesAutoresizingMaskIntoConstraints = false
            tableView.addSubview(spinner)
            spinner?.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
            spinner?.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
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
        
        func showEmptyView(with message: String) {
            tableView.showEmptyView(with: message)
        }
        
        // MARK: - UIPopoverPresentationControllerDelegate
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
    }
}
