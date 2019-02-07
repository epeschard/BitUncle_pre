//
//  String+Translations.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Foundation

typealias Localized = String.Localized

extension String {
    
    enum Localized {
        enum Splash {
            enum Label {
                static let unofficialClient = "UNOFFICIAL_CLIENT".localized
            }
        }
        enum Error {
            static let tryAgain = "ERROR_TRY_AGAIN_LATER".localized
            static let unknownDescription = "ERROR_UNKNOWN_DESCRIPTION".localized
        }
        enum Token {
            enum Alert {
                static let title = "TOKEN_ALERT_TITLE".localized
                static let message = "TOKEN_ALERT_MESSAGE".localized
                static let placeholder = "TOKEN_ALERT_PLACEHOLDER".localized
                static let ok = "TOKEN_ALERT_OK".localized
                static let guide = "TOKEN_ALERT_GUIDE".localized
            }
        }
        enum Profile {
            enum Label {
                static let email = "PROFILE_LABEL_EMAIL".localized
                static let username = "PROFILE_LABEL_USERNAME".localized
                static let slug = "PROFILE_LABEL_SLUG".localized
            }
        }
    }
}
