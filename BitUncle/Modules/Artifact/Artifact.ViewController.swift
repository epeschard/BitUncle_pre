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
    class ViewController: UIViewController, Viewable, UIPopoverPresentationControllerDelegate {
        
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
            title = "Artifacts"
            setup()
            presenter.viewDidLoad()
        }
        
        private func setup() {            
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
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.color = UIColor.Bitrise.purple
            self.spinner.hidesWhenStopped = true
            self.spinner.translatesAutoresizingMaskIntoConstraints = false
            tableView.addSubview(spinner)
            self.spinner?.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
            self.spinner?.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor).isActive = true
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
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
