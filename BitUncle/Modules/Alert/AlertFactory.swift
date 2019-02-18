//
//  AlertFactory.swift
//  BitUncle
//
//  Created by Eugène Peschard on 14/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import UIKit

class AlertFactory {
    
    static func make(with error: ApiError) -> UIAlertController {
        let alert = UIAlertController(title: error.message, message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: Localized.Error.ok, style: .default, handler: nil)
        alert.addAction(ok)
        return alert
    }
    
    static func makeTokenInput(with completion: @escaping Completion) -> UIAlertController {
        let alert = UIAlertController(title: Localized.Token.Alert.title, message: Localized.Token.Alert.message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Localized.Token.Alert.ok, style: .default, handler: { action in
            if let tokenTextField = alert.textFields?[0],
                let tokenText = tokenTextField.text,
                let token = tokenText.data(using: .utf8) {
                _ = KeyChain.save(key: "token", data: token)
                completion()
            }
        })
        ok.isEnabled = false
        alert.addTextField {
            (textFieldEmail: UITextField!) in
            textFieldEmail.placeholder = Localized.Token.Alert.placeholder
        }
        // toggle the OK button when text is added/removed
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: alert.textFields![0], queue: OperationQueue.main) { (notification) in
            let tokenTextField = alert.textFields![0]
            ok.isEnabled = (tokenTextField.text?.count ?? 0 > 0)
        }
        
        let guide = UIAlertAction(title: Localized.Token.Alert.guide, style: .default, handler: { action in
            UIApplication.shared.open(Configuration.tokenGuide)
        })
        alert.addAction(ok)
        alert.addAction(guide)
        return alert
    }
    
}

extension UIAlertController: Navigable {}

