//
//  App.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension App {
    
    @objc (AppViewController)
    class ViewController: UIViewController, Viewable, Navigable, UISplitViewControllerDelegate, PopoverPresenter {
        
        var presenter: Presenter!
        var collectionView: UICollectionView!
        var collectionViewLayout: UICollectionViewFlowLayout!
        var spinner: UIActivityIndicatorView!
        
        var profile: UIImage?
        var profileIcon = #imageLiteral(resourceName: "profile.pdf")
        
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
            assert(self.navigationController != nil)
            title = Localized.App.Label.title
            setupCollectionView()
            addProfileBarButton()
            setupSpinner()
        }
        
        private func setupCollectionView() {
            collectionViewLayout = ColumnFlowLayout()
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            view.addSubview(collectionView)
            collectionView.pinToSuperview()
            collectionView.backgroundColor = UIColor.Bitrise.backgroundGrey
            collectionView.registerReusableCell(Cell.self)
            collectionView.dataSource = presenter.dataSource
            collectionView.delegate = presenter.delegate
        }
        
        private func addProfileBarButton() {
            let profileButton = UIBarButtonItem(image: #imageLiteral(resourceName: "profile.pdf"), style: .plain, target: self, action: #selector(presentProfile))
            navigationItem.rightBarButtonItem = profileButton
        }
        
        private func setupSpinner() {
            spinner = UIActivityIndicatorView(style: .whiteLarge)
            spinner.color = UIColor.Bitrise.purple
            spinner.hidesWhenStopped = true
            spinner.translatesAutoresizingMaskIntoConstraints = false
            collectionView.addSubview(spinner)
            spinner?.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
            spinner?.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
        }
        
        @objc private func presentProfile() {
            presenter.showProfile(from: self)
        }
        
        private func isSetup() -> Bool {
            return (collectionView != nil) && (spinner != nil)
        }
        
        // MARK: - Viewable
        
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
        
        // MARK: - UISplitViewControllerDelegate
        
        func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
            guard let detailAsNavController = secondaryViewController as? UINavigationController else { return false }
            guard let buildsViewController = detailAsNavController.topViewController as? Build.ViewController else { return false }
            if buildsViewController.presenter.parameters.appSlug == "" {
                return true
            }
            return false
        }
        
        // MARK: - PopoverPresenter
        
        func present(_ navigable: Navigable, sender: Any?) {
            guard let window = navigable as? UIViewController, let host = sender as? UIViewController, let rBarButtton = host.navigationItem.rightBarButtonItem else { return }
            window.modalPresentationStyle = .popover
            
            if let popover = window.popoverPresentationController, let delegate = window as? UIPopoverPresentationControllerDelegate {
                popover.barButtonItem = rBarButtton
                popover.delegate = delegate
                popover.permittedArrowDirections = .up
                popover.presentedViewController.preferredContentSize = CGSize(width: 300, height: 172.5)
            }
            host.present(window, animated: true, completion: nil)
        }
    }
}
