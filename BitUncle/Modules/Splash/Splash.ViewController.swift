//
//  SplashViewController.swift
//  BitUncle
//
//  Created by Eugène Peschard on 06/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

extension Splash {
    
    class ViewController: UIViewController, Viewable {
        
        var presenter: Presenter!
        
        private let logoImage: UIImageView = {
            let image = UIImageView(frame: .zero)
            image.image = #imageLiteral(resourceName: "logo.pdf")
            return image
        }()
        
        private let footer: UILabel = {
            let label = UILabel(frame: .zero)
            label.text = Localized.Splash.Label.footer
            label.font = UIFont.systemFont(ofSize: 24)
            label.adjustsFontForContentSizeCategory = true
            label.textAlignment = .center
            label.textColor = .white
            label.numberOfLines = 0
            label.sizeToFit()
            return label
        }()
        
        // MARK: - Run Loop
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        init(with parameters: Parameters) {
            super.init(nibName: nil, bundle: nil)
            presenter = Presenter(self, with: parameters)
            presenter.viewable = self
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            presenter.viewDidLoad()
            addSubviewsAndConstraints()
        }
        
        private func addSubviewsAndConstraints() {
            view.backgroundColor = UIColor.Bitrise.purple
            view.addAutolayoutView(logoImage)
            view.addAutolayoutView(footer)
            
            NSLayoutConstraint.activate([
                logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                logoImage.widthAnchor.constraint(equalToConstant: 240.0),
                logoImage.heightAnchor.constraint(equalToConstant: 240.0),
                footer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
                footer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                footer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8)
                ])
        }
        
        func hide(onCompletion: @escaping Completion) {
            UIView.animate(withDuration: 0.3, animations: {
                self.logoImage.alpha = 0.0
            }) { (success) in
                onCompletion()
            }
        }
        
        // MARK: - Viewable
        
        func setLoadingIndicator(visible: Bool) {
            
        }
        
    }
    
}

