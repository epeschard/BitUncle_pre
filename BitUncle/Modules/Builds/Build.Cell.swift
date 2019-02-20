//
//  Build.Cell.swift
//  BitUncle
//
//  Created by Eugène Peschard on 10/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Build {
    
    @objc (BuildCollectionViewCell)
    class Cell: UICollectionViewCell, ReuseAndFillable {
        
        private enum Constants {
            static let margin: CGFloat = 3
            static let spacing: CGFloat = 8
        }
        
        let isoFormatter = ISO8601DateFormatter()
        
        //MARK: - UI Elements
        
        let sideMark: UIView = {
            let view = UIView(frame: .zero)
            return view
        }()
        
        var statusImage: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            return imageView
        }()
        
        let statusLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
            return label
        }()
        
        let buildNumberLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .right
            label.textColor = .gray
            label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            return label
        }()

        let branchIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        let border: UIView = {
            let border = UIView()
            border.isUserInteractionEnabled = false
            border.layer.borderWidth = 1
            border.layer.cornerRadius = 4
            border.clipsToBounds = true
            return border
        }()

        let prIdLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.textColor = .white
            label.sizeToFit()
            return label
        }()

        let branchLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.textColor = .gray
            label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            label.adjustsFontSizeToFitWidth = false
            label.lineBreakMode = .byTruncatingTail
            return label
        }()
        
        let prTargetLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.textColor = .gray
            return label
        }()

        let workflowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        let workflowLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.textColor = .gray
            return label
        }()
        
        let separator: UIView = {
            let line = UIView()
            line.isUserInteractionEnabled = false
            line.backgroundColor = .gray
            return line
        }()
        
        let triggeredLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .left
            label.textColor = .gray
            return label
        }()

        let durationLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 1
            label.textAlignment = .right
            label.textColor = .gray
            return label
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
            contentView.layer.cornerRadius = 5
            contentView.clipsToBounds = true
            
            contentView.addAutolayoutView(sideMark)
            
            contentView.addAutolayoutView(statusImage)
            contentView.addAutolayoutView(statusLabel)
            contentView.addAutolayoutView(buildNumberLabel)
            
            contentView.addAutolayoutView(branchIcon)
            contentView.addAutolayoutView(border)
            border.addAutolayoutView(prIdLabel)
            border.addAutolayoutView(branchLabel)
            border.addAutolayoutView(prTargetLabel)
            
            contentView.addAutolayoutView(workflowIcon)
            contentView.addAutolayoutView(workflowLabel)
            
            contentView.addAutolayoutView(separator)
            
            contentView.addAutolayoutView(triggeredLabel)
            contentView.addAutolayoutView(durationLabel)
            
            let x = CGFloat(10)
            NSLayoutConstraint.activate([
                sideMark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                sideMark.widthAnchor.constraint(equalToConstant: 10),
                sideMark.topAnchor.constraint(equalTo: contentView.topAnchor),
                sideMark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                statusImage.leadingAnchor.constraint(equalTo: sideMark.trailingAnchor, constant: x),
                statusImage.widthAnchor.constraint(equalToConstant: 20),
                statusImage.heightAnchor.constraint(equalTo: statusImage.widthAnchor),
                statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: x),
                statusLabel.heightAnchor.constraint(equalToConstant: 20),
                statusLabel.leadingAnchor.constraint(equalTo: statusImage.trailingAnchor, constant: x),
                statusLabel.trailingAnchor.constraint(greaterThanOrEqualTo: buildNumberLabel.leadingAnchor, constant: -x),
                statusImage.topAnchor.constraint(equalTo: statusLabel.topAnchor),
                
                buildNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -x),
                buildNumberLabel.topAnchor.constraint(equalTo: statusLabel.topAnchor),
                
                branchIcon.leadingAnchor.constraint(equalTo: statusImage.leadingAnchor),
                branchIcon.widthAnchor.constraint(equalTo: statusImage.widthAnchor),
                branchIcon.heightAnchor.constraint(equalTo: branchIcon.widthAnchor),
                branchIcon.topAnchor.constraint(equalTo: branchLabel.topAnchor),
                
                border.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                border.trailingAnchor.constraint(equalTo: prTargetLabel.trailingAnchor),
                border.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -x),
                border.topAnchor.constraint(equalTo: branchLabel.topAnchor),
                border.bottomAnchor.constraint(equalTo: branchLabel.bottomAnchor),
                prIdLabel.leadingAnchor.constraint(equalTo: border.leadingAnchor),
                prIdLabel.trailingAnchor.constraint(equalTo: branchLabel.leadingAnchor),
                prIdLabel.topAnchor.constraint(equalTo: branchLabel.topAnchor),
                prTargetLabel.topAnchor.constraint(equalTo: branchLabel.topAnchor),
                branchLabel.trailingAnchor.constraint(equalTo: prTargetLabel.leadingAnchor),
                branchLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: x),
                prTargetLabel.trailingAnchor.constraint(equalTo: border.trailingAnchor),
                
                workflowIcon.topAnchor.constraint(equalTo: branchIcon.bottomAnchor, constant: x),
                workflowIcon.leadingAnchor.constraint(equalTo: statusImage.leadingAnchor),
                workflowIcon.widthAnchor.constraint(equalTo: statusImage.widthAnchor),
                workflowIcon.heightAnchor.constraint(equalTo: workflowIcon.widthAnchor),
                workflowIcon.centerYAnchor.constraint(equalTo: workflowLabel.centerYAnchor),
                workflowLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                
                separator.topAnchor.constraint(equalTo: workflowLabel.bottomAnchor, constant: x),
                separator.trailingAnchor.constraint(equalTo: durationLabel.trailingAnchor),
                separator.leadingAnchor.constraint(equalTo: sideMark.trailingAnchor),
                separator.bottomAnchor.constraint(equalTo: triggeredLabel.topAnchor, constant: -x),
                separator.heightAnchor.constraint(equalToConstant: 1),
                
                triggeredLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
                durationLabel.bottomAnchor.constraint(equalTo: triggeredLabel.bottomAnchor),
                durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -x),
            ])
        }
        
        func fill(with type: Type?) {
            let na = Localized.Build.Label.na
            let statusColor = UIColor.Bitrise.color(for: (type as? DataModel)?.status ?? 1)
            self.sideMark.backgroundColor = statusColor
            let statusText = (type as? DataModel)?.statusText.capitalized
            self.statusImage.image = statusImage(from: type as? DataModel).image(with: statusColor)
            self.statusLabel.text = statusText ?? na
            self.statusLabel.textColor = statusColor
            
            let statusColor10 = statusColor.withAlphaComponent(CGFloat(0.1))
            self.branchLabel.backgroundColor = statusColor10
            self.prTargetLabel.backgroundColor = statusColor10
            let statusColor50 = statusColor.withAlphaComponent(CGFloat(0.5))
            self.prIdLabel.backgroundColor = statusColor50

            let prId = (type as? DataModel)?.pullRequestId
            let prTarget = (type as? DataModel)?.pullRequestTargetBranch
            if isPR(from: type) {
                self.prIdLabel.text = " \(prId ?? 0) "
                self.prTargetLabel.text = "→ \(prTarget ?? na) "
            }
            self.branchIcon.image = #imageLiteral(resourceName: "git-branch.pdf").image(with: statusColor)
            
            border.layer.borderColor = statusColor.cgColor
            separator.backgroundColor = statusColor
            
            let branchText = (type as? DataModel)?.branch
            self.branchLabel.text = " \(branchText ?? na) "
            
            self.workflowIcon.image = UIImage(named: "workflow")?.image(with: statusColor)
            let workflowText = (type as? DataModel)?.triggeredWorkflow
            self.workflowLabel.text = " \(workflowText ?? na) "
            
            self.triggeredLabel.text = triggeredText(from: type)
            let durationText = duration(from: type)
            self.durationLabel.text = "🕑 \(durationText)"
            self.buildNumberLabel.text = "#\((type as? DataModel)?.buildNumber ?? 0)"
        }
        
        private func triggeredText(from type: Type?) -> String {
            if let triggeredDate = triggeredDate(from: type) {
                let triggeredTime = DateFormatter.localizedString(from: triggeredDate, dateStyle: .none, timeStyle: .short)
                return "\(Localized.Build.Label.triggeredAt) \(triggeredTime)"
            } else {
                return Localized.Build.Label.noTriggeredDate
            }
        }
        
        private func duration(from type: Type?) -> String {
            let noDuration = Localized.Build.Label.noDuration
            if let start = triggeredDate(from: type),
                let finish = finishedDate(from: type) {
                let interval = finish.timeIntervalSince(start)
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.hour, .minute, .second]
                formatter.unitsStyle = .short
                return formatter.string(from: interval) ?? noDuration
            } else {
                return noDuration
            }
        }
        
        private func triggeredDate(from type: Type?) -> Date? {
            let triggeredString = (type as? DataModel)?.triggeredAt ?? ""
            return isoFormatter.date(from: triggeredString)
        }
        
        private func finishedDate(from type: Type?) -> Date? {
            let finishedString = (type as? DataModel)?.finishedAt ?? ""
            return isoFormatter.date(from: finishedString)
        }
        
        private func statusImage(from type: Type?) -> UIImage {
            switch (type as? DataModel)?.status ?? 1 {
            case 0: // dots
                return #imageLiteral(resourceName: "kebab-horizontal.pdf")
            case 1: // check
                return #imageLiteral(resourceName: "check.pdf")
            case 2: // cross
                return #imageLiteral(resourceName: "x.pdf")
            case 3: // slash
                return #imageLiteral(resourceName: "circle-slash.pdf")
            default: // check
                return #imageLiteral(resourceName: "check.pdf")
            }
            
        }
        
        private func isPR(from type: Type?) -> Bool {
            return (type as? DataModel)?.pullRequestId != 0
        }
    }
}
