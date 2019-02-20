//
//  Build.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 09/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Build {
    
    @objc (BuildViewController)
    class ViewController: UIViewController, Viewable, UIPopoverPresentationControllerDelegate {
        
        var presenter: Presenter!
        var collectionView: UICollectionView!
        var collectionViewLayout: UICollectionViewFlowLayout!
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
            title = presenter.parameters.appName
            setup()
            presenter.viewDidLoad()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        private func setup() {
//            assert(self.navigationController != nil)
            
            setupCollectionView()
            setupSpinner()
        }
        
        private func setupCollectionView() {
            let collectionViewLayout = ColumnFlowLayout()
            collectionViewLayout.cellHeight = CGFloat(145.0)
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            view.addSubview(collectionView)
            collectionView.pinToSuperview()
            collectionView.backgroundColor = UIColor.Bitrise.backgroundGrey
            collectionView.registerReusableCell(Cell.self)
            collectionView.dataSource = presenter.dataSource
            collectionView.delegate = presenter.delegate
        }
        
        private func setupSpinner() {
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.color = UIColor.Bitrise.purple
            self.spinner.hidesWhenStopped = true
            self.spinner.translatesAutoresizingMaskIntoConstraints = false
            collectionView.addSubview(spinner)
            self.spinner?.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor).isActive = true
            self.spinner?.centerYAnchor.constraint(equalTo: self.collectionView.centerYAnchor).isActive = true
        }
        
        private func isSetup() -> Bool {
            return (collectionView != nil) && (spinner != nil)
        }
        
        // MARK: - UIPopoverPresentationControllerDelegate
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        //MARK: - AppViewable
        
        func reload() {
            self.collectionView.reloadData()
        }
                
        func setLoading(visible: Bool) {
            if !isSetup() {
                setup()
            }
            if visible {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }
        
        func showEmptyView(with message: String) {
            collectionView.showEmptyView(with: message)
        }
        
    }
}
