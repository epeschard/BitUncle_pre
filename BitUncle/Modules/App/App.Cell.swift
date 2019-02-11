//
//  App.Cell.swift
//  BitUncle
//
//  Created by Eugène Peschard on 08/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore
import SDWebImage

extension App {
    
    @objc (AppCollectionViewCell)
    class Cell: UICollectionViewCell, ReuseAndFillable {
        
        private enum Constants {
            static let margin: CGFloat = 3
            static let spacing: CGFloat = 8
        }
        
        //MARK: - UI Elements
        
        let avatar: UIImageView = {
            let tap = CGRect(x: 0, y: 0, width: 44, height: 44)
            let imageView = UIImageView(frame: tap)
            return imageView
        }()
        
        let initials: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
            label.textColor = .white
            return label
        }()
        
        let ownerLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .left
            label.textColor = .darkGray
            label.setContentCompressionResistancePriority(.required, for: .vertical)
            return label
        }()
        
        let platformLogo: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.tintColor = .darkGray
            return imageView
        }()
        
        let statusLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .right
            label.layer.cornerRadius = 12
            label.layer.borderWidth = 1
            label.clipsToBounds = true
            label.textAlignment = .center
            label.setContentCompressionResistancePriority(.required, for: .vertical)
            return label
        }()
        
        let projectLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .left
            label.setContentCompressionResistancePriority(.required, for: .vertical)
            return label
        }()
        
        let stackView0: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .center
            stackView.spacing = Constants.spacing
            return stackView
        }()
        
        let stackView1: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = Constants.spacing
            return stackView
        }()
        
        let stackView2: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = Constants.spacing
            return stackView
        }()
        
        let stackView3: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = Constants.spacing
            return stackView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 12
            contentView.clipsToBounds = true
            
            contentView.addAutolayoutView(stackView0)
            stackView0.pinToSuperview()
            
            stackView0.addArrangedSubview(initials)
            stackView0.addArrangedSubview(avatar)
            stackView0.addArrangedSubview(stackView1)
            
            stackView1.addArrangedSubview(stackView2)
            stackView1.addArrangedSubview(stackView3)
            
            stackView2.addArrangedSubview(platformLogo)
            stackView2.addArrangedSubview(ownerLabel)
            stackView2.addArrangedSubview(statusLabel)
            
            stackView3.addArrangedSubview(projectLabel)
            
            NSLayoutConstraint.activate([
                avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                avatar.heightAnchor.constraint(equalTo: stackView1.heightAnchor),
                avatar.widthAnchor.constraint(equalTo: avatar.heightAnchor),
                avatar.widthAnchor.constraint(equalToConstant: 65),                initials.heightAnchor.constraint(equalTo: avatar.heightAnchor),
                initials.widthAnchor.constraint(equalTo: initials.heightAnchor),
                platformLogo.heightAnchor.constraint(equalToConstant: 25),
                platformLogo.widthAnchor.constraint(equalTo: platformLogo.heightAnchor),
                statusLabel.widthAnchor.constraint(equalTo: statusLabel.heightAnchor),
                ownerLabel.heightAnchor.constraint(equalTo: platformLogo.heightAnchor),
                stackView0.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackView0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                ])
        }
        
        func fill(with type: Type?) {
            let title = (type as? DataModel)?.title
            if let avatarUrl = (type as? DataModel)?.avatarUrl {
                avatar.sd_setImage(with: avatarUrl, placeholderImage: nil)
                stackView0.removeArrangedSubview(initials)
            } else {
                stackView0.removeArrangedSubview(avatar)
                initials.text = "\(title?.first.uppercased() ?? "1")\(title?.last.uppercased() ?? "9")"
                initials.backgroundColor = UIColor.Bitrise.green
            }
            self.platformLogo.image = (type as? DataModel)?.projectType == "ios" ? #imageLiteral(resourceName: "apple.pdf") : #imageLiteral(resourceName: "android.pdf")
            self.ownerLabel.text = (type as? DataModel)?.repoOwner.uppercased()
            accessibilityValue = title
            let status = (type as? DataModel)?.status
            if status == 1 {
                self.statusLabel.text = "✓"
                self.statusLabel.textColor = UIColor.Bitrise.success
                self.statusLabel.layer.borderColor = UIColor.Bitrise.success.cgColor
            } else {
                self.statusLabel.text = "✗"
                self.statusLabel.textColor = UIColor.Bitrise.failed
                self.statusLabel.layer.borderColor = UIColor.Bitrise.success.cgColor
            }
            self.projectLabel.text = (type as? DataModel)?.title
        }
    }
}
