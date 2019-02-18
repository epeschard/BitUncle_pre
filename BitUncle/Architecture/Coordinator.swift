//
//  Coordinator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//


class Coordinator {
    var navigator: Navigator
    var parameters: Parameters!
    var actions: Actions!
    
    init(with navigator: Navigator) {
        self.navigator = navigator
    }
    
    private var appListView: App.ViewController!
    private var buildListView: Build.ViewController!
    private var logListView: Log.ViewController!
    
    func start() {
        showAppListView()
        fetchApps()
    }
    
    func showAppListView() {
        appListView = App.makeViewController(with: actions, and: parameters)
        navigator.masterNavController?.show(appListView, sender: nil)
    }
    
    func fetchApps() {
        appListView.presenter.fetchApps()
    }
    
    func presentProfile(from parent: Navigable) {
        let profileScreen = Profile.makeViewController(with: actions, and: parameters)
        if let host = parent as? PopoverPresenter {
            host.present(profileScreen, sender: parent)
        }
    }
    
    func showBuildListView() {
        buildListView = Build.makeViewController(with: actions, and: parameters)
        let buildListViewInNav = UIKitNavigator(rootViewController: buildListView)
        navigator.masterNavController?.showDetailViewController(buildListViewInNav, sender: nil)
        fetchBuilds()
    }
    
    func showLogListView() {
        logListView = Log.makeViewController(with: actions, and: parameters)
        let logListViewInNav = UIKitNavigator(rootViewController: logListView)
        navigator.masterNavController?.showDetailViewController(logListViewInNav, sender: nil)
        fetchBuilds()
    }
    
    func presentArtifacts(from parent: Navigable) {
        let artifactScreen = Artifact.makeViewController(with: actions, and: parameters)
        if let host = parent as? PopoverPresenter {
            host.present(artifactScreen, sender: parent)
        }
    }
    
    func fetchBuilds() {
        buildListView.presenter.fetchBuilds()
    }
    
    func askForToken(completion: @escaping Completion) {
        let alert = AlertFactory.makeTokenInput {
            completion()
        }
        navigator.present(alert, completion: nil)
    }

    func showAlert(_ error: ApiError) {
        let alert = AlertFactory.make(with: error)
        navigator.present(alert, completion: nil)
    }

}
