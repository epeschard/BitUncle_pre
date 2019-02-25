//
//  Log.Cell.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit
import StanwoodCore
import SwiftRichString

extension Log {
    
    @objc (LogTableViewCell)
    class Cell: UITableViewCell, ReuseAndFillable {
        
        private enum Constants {
            static let margin: CGFloat = 3
            static let spacing: CGFloat = 8
        }
        
        //MARK: - UI Elements
        
        let topLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .left
            label.setContentCompressionResistancePriority(.required, for: .vertical)
            return label
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.spacing = Constants.spacing
            return stackView
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            selectionStyle = .none
            backgroundColor = UIColor.Bitrise.logBackground
            contentView.addAutolayoutView(stackView)
            stackView.addArrangedSubview(topLabel)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                ])
        }
        
        func fill(with type: Type?) {
            guard let chunk = (type as? DataModel)?.chunk else { return }
            
            self.topLabel.attributedText = parse(string: chunk)
            //
            let lines = chunk.components(separatedBy: "\n")
            
            let downArrow = "                                          ▼"
            let downArrowIndex = lines.firstIndex(of: downArrow)
            
            for line in lines {
                if line.contains("                                          ▼") {
                    print("'\(line)'")
                }
            }
        }
        
        let greenMonospace = Style {
            $0.color = UIColor.Bitrise.greenText
            $0.font = SystemFonts.Courier.font(size: 12)
        }
        let whiteMonospace = Style {
            $0.color = UIColor.white
            $0.font = SystemFonts.Courier.font(size: 12)
        }
        let blueMonospace = Style {
            $0.color = UIColor.Bitrise.blueText
            $0.font = SystemFonts.Courier.font(size: 12)
        }
        let redMonospace = Style {
            $0.color = UIColor.Bitrise.redText
            $0.font = SystemFonts.Courier.font(size: 12)
        }
        let yellowMonospace = Style {
            $0.color = UIColor.Bitrise.yellowText
            $0.font = SystemFonts.Courier.font(size: 12)
        }
        
        func parse(string: String) -> NSMutableAttributedString {
            var firstIndex = string.startIndex
            var lastIndex = string.endIndex
            var code: String = ""
            var range: Range<String.Index>?
            let result = NSMutableAttributedString()
            repeat {
                range = string.range(of: "\u{001B}[", options: String.CompareOptions.caseInsensitive, range: firstIndex..<string.endIndex, locale: nil)
                if let upperBound = range?.upperBound, let lowerBound = range?.lowerBound {
                    let chunk = String(string[firstIndex...lowerBound])
                    result.append(chunk.set(style: color(code)))
                    
                    //get the color number
                    let char0 = string[upperBound]
                    lastIndex = string.index(upperBound, offsetBy: 1)
                    var char1 = string[lastIndex]
                    if (char1 >= "0" && char1 <= "9") {
                        code = String(char0) + String(char1)
                    } else {
                        code = String(char0)
                    }
                    
                    //search for the end of color string
                    while (char1 != "m") {
                        lastIndex = string.index(lastIndex, offsetBy: 1)
                        char1 = string[lastIndex]
                    }
                    lastIndex = string.index(lastIndex, offsetBy: 1)
                    
                    firstIndex = lastIndex
                } else {
                    let chunk = String(string[firstIndex..<string.endIndex])
                    result.append(chunk.set(style: color(code)))
                }
            } while (range != nil)
            return result
        }
        
        func color(_ code: String) -> Style {
            switch code {
            case "31": return redMonospace
            case "32": return greenMonospace
            case "33": return yellowMonospace
            case "34": return blueMonospace
            default: return whiteMonospace
            }
        }
    }
}
