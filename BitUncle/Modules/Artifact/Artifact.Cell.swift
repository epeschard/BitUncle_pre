//
//  Artifact.Cell.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore

extension Artifact {
    
    @objc (ArtifactTableViewCell)
    class Cell: UITableViewCell, ReuseAndFillable {
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func fill(with type: Type?) {
            guard let title = (type as? DataModel)?.title else { return }
            
            self.textLabel?.text = (type as? DataModel)?.title
            if title.contains("plist") {
                self.imageView?.image = #imageLiteral(resourceName: "plist.pdf")
            } else if title.contains("dSYM") {
                self.imageView?.image = #imageLiteral(resourceName: "dSYM.pdf")
            } else if title.contains("ipa") {
                self.imageView?.image = #imageLiteral(resourceName: "IPA.pdf")
            }
        }
    }
}
