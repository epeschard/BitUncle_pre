//
//  EndPoint.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

import Moya

private let DEFAULT_PAGE = 20

enum EndPoint {
    case getProfile
}

extension EndPoint: TargetType {
    
    var baseURL: URL { return Configuration.baseURL }
    
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        switch self {
        case .getProfile: dateFormatter.dateFormat = Date.Format.matches.rawValue
        }
        return JSONDecoder.DateDecodingStrategy.formatted(dateFormatter)
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        switch self {
        case .getProfile: return .convertFromSnakeCase
        }
    }
    
    var path: String {
        switch self {
        case .getProfile: return "v0.1/me"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .getProfile: return .get
        }
    }
    
    var sampleData: Data {
        fatalError()
    }
    
    var task: Task {
        switch self {
        case .getProfile:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
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