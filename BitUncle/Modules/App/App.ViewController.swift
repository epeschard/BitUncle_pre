//
//  App.ViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import SDWebImage

extension App {
    
    @objc (AppViewController)
    class ViewController: UIViewController, Viewable, UISplitViewControllerDelegate {
        
        var presenter: Presenter!
        var collectionView: UICollectionView!
        var collectionViewLayout: UICollectionViewFlowLayout!
        var spinner: UIActivityIndicatorView!
        
        var profile: Profile.DataModel? {
            didSet {
                guard let urlString = profile?.avatarUrl, let imageURL = URL(string: urlString) else { return }
                profileImageView.sd_setImage(with: imageURL, placeholderImage: #imageLiteral(resourceName: "profile.pdf"))
                navigationItem.title = profile?.username ?? Localized.App.Label.title
            }
        }
        var profileImageView = UIImageView(image: #imageLiteral(resourceName: "profile.pdf"))
        
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
            title = Localized.App.Label.title
            setup()
            presenter.viewDidLoad()
        }
        
        private func setup() {
            assert(self.navigationController != nil)
            
            setupCollectionView()
            setupSpinner()
            addProfileBarButton()
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
        
        private func setupSpinner() {
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.color = UIColor.Bitrise.purple
            self.spinner.hidesWhenStopped = true
            self.spinner.translatesAutoresizingMaskIntoConstraints = false
            collectionView.addSubview(spinner)
            self.spinner?.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor).isActive = true
            self.spinner?.centerYAnchor.constraint(equalTo: self.collectionView.centerYAnchor).isActive = true
        }
        
        private func addProfileBarButton() {
            let profileBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "profile.pdf"), style: .plain, target: self, action: #selector(presentProfile))
            navigationItem.rightBarButtonItem = profileBarButton
        }
        
        //MARK: - AppViewable
        
        func reload() {
            self.collectionView.reloadData()
        }
        
        @objc func presentProfile() {
            presenter.showPopover(from: self)
        }
        
        func setLoading(visible: Bool) {
            if visible {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }
        
        //MARK: - UISplitViewControllerDelegate
        
        func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
            guard let detailAsNavController = secondaryViewController as? UINavigationController else { return false }
            guard let buildsViewController = detailAsNavController.topViewController as? Build.ViewController else { return false }
            if buildsViewController.presenter.parameters.appSlug == "" {
                return true
            }
            return false
        }
    }
}
