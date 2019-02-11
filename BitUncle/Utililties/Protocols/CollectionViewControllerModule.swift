//
//  CollectionViewControllerModule.swift
//  BitUncle
//
//  Created by Eugène Peschard on 10/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

//import UIKit
//import StanwoodCore
//
////protocol CollectionViewControllerModule: class, UIViewController, Viewable {
////    <#requirements#>
////}
//
//class ViewController: UIViewController, Viewable {
//    
//    var presenter: Presenter!
//    var collectionView: UICollectionView!
//    var collectionViewLayout: UICollectionViewFlowLayout!
//    
//    // MARK: - Run Loop
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    init(with actions: Actions, and parameters: Parameters) {
//        presenter = Presenter(with: actions, and: parameters)
//        super.init(nibName: nil, bundle: nil)
//        presenter.viewable = self
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = presenter.parameters.appName
//        setup()
//        presenter.viewDidLoad()
//    }
//    
//    func reload() {
//        self.collectionView.reloadData()
//    }
//    
//    private func setup() {
//        assert(self.navigationController != nil)
//        
//        setupCollectionView()
//    }
//    
//    private func setupCollectionView() {
//        let collectionViewLayout = ColumnFlowLayout()
//        collectionViewLayout.cellHeight = CGFloat(132.0)
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
//        view.addSubview(collectionView)
//        collectionView.pinToSuperview()
//        collectionView.backgroundColor = UIColor.Bitrise.backgroundGrey
//        collectionView.registerReusableCell(Cell.self)
//        collectionView.dataSource = presenter.dataSource
//        collectionView.delegate = presenter.delegate
//    }
//    
//}
//
//class Presenter {
//    
//    weak var viewable: Viewable?
//    var parameters: Parameters
//    var actions: Actions
//    
//    var dataSource: DataSource!
//    var delegate: Delegate!
//    
//    required init(for viewController: Viewable? = nil, with actions: Actions, and parameters: Parameters) {
//        self.viewable = viewController
//        self.actions = actions
//        self.parameters = parameters
//        
//        delegate = Delegate(dataType: Stanwood.Elements<DataModel>(items: []))
//        dataSource = DataSource(dataType: Stanwood.Elements<DataModel>(items: []))
//        delegate.presenter = self
//        dataSource.presenter = self
//    }
//    
//    func viewDidLoad() {
//        let appSlug = parameters.appSlug
//        guard appSlug != "" else { return }
//        actions.getBuilds(for: appSlug) {
//            result in
//            switch result {
//            case .success(let data):
//                let elements = Stanwood.Elements(items: data)
//                self.dataSource.update(with: elements)
//                self.delegate.update(with: elements)
//                self.viewable?.reload()
//            case .failure(let error):
//                self.actions.showAlert(error)
//            }
//            self.actions.setLoading(visible: false)
//        }
//    }
//    
//    func didSelect(_  build: DataModel) {
//        parameters.buildSlug = build.slug
//        parameters.buildName = "Build: \(build.buildNumber)"
//    }
//}
