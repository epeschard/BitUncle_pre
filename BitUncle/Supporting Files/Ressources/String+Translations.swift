//
//  String+Translations.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

typealias Localized = String.Localized

extension String {
    
    enum Localized {
        enum Splash {
            enum Label {
                static let footer = "SPLASH_LABEL_FOOTER".localized
            }
        }
        enum Error {
            static let tryAgain = "ERROR_TRYAGAIN".localized
            static let unknownDescription = "ERROR_UNKNOWNDESCRIPTION".localized
            static let ok = "ERROR_OK".localized
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
                static let title = "PROFILE_LABEL_TITLE".localized
                static let email = "PROFILE_LABEL_EMAIL".localized
                static let username = "PROFILE_LABEL_USERNAME".localized
                static let slug = "PROFILE_LABEL_SLUG".localized
                static let logout = "PROFILE_LABEL_LOGOUT".localized
                static let loading = "PROFILE_LABEL_LOADING".localized
            }
        }
        
        enum App {
            enum Label {
                static let title = "APP_LABEL_TITLE".localized
                static let emptyMessage = "APP_LABEL_EMPTYMESSAGE".localized
            }
        }
        
        enum Log {
            enum BarButton {
                static let artifacts = "LOG_BARBUTTON_ARTIFACTS".localized
            }
        }
    }
}
//                let token2save = "LqoGw8n2M1Ak7tGW_f2z2vFypmwH2SBVDuYh1all3cBk7HaM-i-mcIc6SooxCrVbQNQGmxX1hgbrEaxcrk4Spg".data(using: .utf8)
