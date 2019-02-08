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
    class ViewController: UIViewController, Viewable, UISplitViewControllerDelegate {
        
        var presenter: Presenter!
        var collectionView: UICollectionView!
        var collectionViewLayout: UICollectionViewFlowLayout!
        
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
            title = Localized.App.Label.title
            setup()
            presenter.viewDidLoad()
            addProfileBarButton()
        }
        
        func reload() {
            self.collectionView.reloadData()
        }
        
        private func setup() {
            assert(self.navigationController != nil)
            
            setupCollectionView()
        }
        
        private func setupCollectionView() {
            let collectionViewLayout = ColumnFlowLayout()
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
        
        @objc private func presentProfile() {
            presenter.showProfile()
        }
        
    }
}
