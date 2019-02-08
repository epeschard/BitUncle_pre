//
//  EndPoint.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Moya

private let DEFAULT_PAGE = 20

enum EndPoint {
    case getProfile
    case getApps(String?)
}

extension EndPoint: TargetType {
    
    var baseURL: URL { return Configuration.baseURL }
    
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        switch self {
        case .getProfile, .getApps: dateFormatter.dateFormat = Date.Format.matches.rawValue
        }
        return JSONDecoder.DateDecodingStrategy.formatted(dateFormatter)
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        switch self {
        case .getProfile, .getApps: return .convertFromSnakeCase
        }
    }
    
    var path: String {
        switch self {
        case .getProfile: return "v0.1/me"
        case .getApps: return "v0.1/me/apps"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .getProfile, .getApps: return .get
        }
    }
    
    var sampleData: Data {
        fatalError()
    }
    
    var task: Task {
        switch self {
        case .getProfile:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getApps(let next):
            if let nextPage = next {
                return .requestParameters(parameters: ["limit": DEFAULT_PAGE, "sort_by": "last_build_at", "next": nextPage], encoding: URLEncoding.default)
            } else {
                return .requestParameters(parameters: ["limit": DEFAULT_PAGE, "sort_by": "last_build_at"], encoding: URLEncoding.default)
            }
        }
    }
    
    private func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return (seconds / 60, (seconds % 3600) % 60)
    }
    
    var validationType: ValidationType { return .successCodes }
    
    public var validate: Bool {
        switch self {
        default:
            return false
        }
    }
    public var headers: [String: String]? {
        if let token = KeyChain.getToken() {
            return ["Authorization": "token \(token)"]
        } else {
            return [:]
        }
    }
}
